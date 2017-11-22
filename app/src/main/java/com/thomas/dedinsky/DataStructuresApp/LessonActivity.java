package com.thomas.dedinsky.DataStructuresApp;

import android.content.ContentValues;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.databinding.DataBindingUtil;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.design.widget.BottomNavigationView;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.util.Log;
import android.view.MenuItem;
import android.view.View;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;

import java.text.SimpleDateFormat;
import java.util.Calendar;

public class LessonActivity extends AppCompatActivity {

    private LinearLayout section1;
    private LinearLayout section2;
    private TextView text1;
    private TextView text2;
    private static final String TAG = "LessonActivity";
    protected String name;
    protected String summary;
    protected String code;

    private BottomNavigationView.OnNavigationItemSelectedListener mOnNavigationItemSelectedListener
            = new BottomNavigationView.OnNavigationItemSelectedListener() {

        @Override
        public boolean onNavigationItemSelected(@NonNull MenuItem item) {
            LinearLayout.LayoutParams lp = (LinearLayout.LayoutParams) section2.getLayoutParams();
            switch (item.getItemId()) {
                case R.id.navigation_home:
                    text1.setText(summary);
                    text2.setText("");
                    lp.weight = 0;
                    section2.setLayoutParams(lp);
                    return true;
                case R.id.navigation_dashboard:
                    text1.setText(summary);
                    text2.setText(code);
                    lp.weight = 1;
                    section2.setLayoutParams(lp);
                    return true;
                case R.id.navigation_notifications:
                    text1.setText(code);
                    text2.setText("");
                    lp.weight = 0;
                    section2.setLayoutParams(lp);
                    return true;
            }
            return false;
        }

    };

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_lesson);
        readFromDB();
        section1 = (LinearLayout) findViewById(R.id.section1);
        section2 = (LinearLayout) findViewById(R.id.section2);
        text1 = (TextView) findViewById(R.id.text1);
        text1.setText(summary);
        text2 = (TextView) findViewById(R.id.text2);
        BottomNavigationView navigation = (BottomNavigationView) findViewById(R.id.navigation);
        navigation.setOnNavigationItemSelectedListener(mOnNavigationItemSelectedListener);

        //text1.setText(summary);
    }

    private void readFromDB() {
        MyAppApplication mApp = ((MyAppApplication)getApplicationContext());
        SQLiteDatabase database = new SampleDBSQLiteHelper(this).getReadableDatabase();
        String[] projection = {
                SampleDBContract.Lesson._ID,
                SampleDBContract.Lesson.COLUMN_NAME,
                SampleDBContract.Lesson.COLUMN_CHAPTER,
                SampleDBContract.Lesson.COLUMN_SUMMARY,
                SampleDBContract.Lesson.COLUMN_CODE
        };
        String selection =
                SampleDBContract.Lesson._ID + " = ?";
        String[] selectionArgs = {Integer.toString(mApp.getLessonID())};
        Cursor cursor = database.query(
                SampleDBContract.Lesson.TABLE_NAME,     // The table to query
                projection,                               // The columns to return
                selection,                                // The columns for the WHERE clause
                selectionArgs,                            // The values for the WHERE clause
                null,                                     // don't group the rows
                null,                                     // don't filter by row groups
                null,                                     // don't sort
                "1"                                       // limit number of results
        );
        cursor.moveToFirst();
        name = cursor.getString(cursor.getColumnIndexOrThrow(SampleDBContract.Lesson.COLUMN_NAME));
        summary = cursor.getString(cursor.getColumnIndexOrThrow(SampleDBContract.Lesson.COLUMN_SUMMARY));
        code = cursor.getString(cursor.getColumnIndexOrThrow(SampleDBContract.Lesson.COLUMN_CODE));
    }
}
