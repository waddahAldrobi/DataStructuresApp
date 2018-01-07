package com.thomas.dedinsky.DataStructuresApp;

import android.content.ContentValues;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.databinding.DataBindingUtil;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.support.v7.widget.LinearLayoutManager;
import android.util.Log;
import android.view.View;
import android.widget.Toast;

import com.thomas.dedinsky.DataStructuresApp.databinding.ActivityEmployerBinding;

import java.text.SimpleDateFormat;
import java.util.Calendar;

public class ChapterActivity extends AppCompatActivity {

    private static final String TAG = "ChapterActivity";
    private ActivityEmployerBinding binding;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        if (((MyAppApplication)getApplicationContext()).getIsDarkTheme()) {
            this.setTheme(R.style.dark);
        }
        binding = DataBindingUtil.setContentView(this, R.layout.activity_employer);
        binding.recycleView.setLayoutManager(new LinearLayoutManager(this));
        readFromDB();
    }

    private void readFromDB() {
        MyAppApplication mApp = ((MyAppApplication)getApplicationContext());
        SQLiteDatabase database = new SampleDBSQLiteHelper(this).getReadableDatabase();
        String[] projection = {
                SampleDBContract.Lesson._ID,
                SampleDBContract.Lesson.COLUMN_NAME
        };
        String selection = SampleDBContract.Lesson.COLUMN_CHAPTER + " like ?";
        String[] selectionArgs = {"%" + mApp.getChapterName() + "%"};
        Cursor cursor = database.query(
                SampleDBContract.Lesson.TABLE_NAME,       // The table to query
                projection,                               // The columns to return
                selection,                                // The columns for the WHERE clause
                selectionArgs,                            // The values for the WHERE clause
                null,                                     // don't group the rows
                null,                                     // don't filter by row groups
                null                                      // don't sort
        );
        binding.recycleView.setAdapter(new SampleRecyclerViewCursorAdapter(mApp, this, cursor, true));
    }
}
