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

public class OverviewActivity extends AppCompatActivity {

    private static final String TAG = "OverviewActivity";
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
        SQLiteDatabase database = new SampleDBSQLiteHelper(this).getReadableDatabase();
        String[] projection = {
                SampleDBContract.Lesson.COLUMN_CHAPTER
        };
        Cursor cursor = database.query(
                true,                                     //distinct
                SampleDBContract.Lesson.TABLE_NAME,       // The table to query
                projection,                               // The columns to return
                null,                                     // The columns for the WHERE clause
                null,                                     // The values for the WHERE clause
                null,                                     // don't group the rows
                null,                                     // don't filter by row groups
                null,                                     // don't sort
                null                                      // no limit
        );
        binding.recycleView.setAdapter(new SampleRecyclerViewCursorAdapter(((MyAppApplication)getApplicationContext()), this, cursor, false));
    }
}
