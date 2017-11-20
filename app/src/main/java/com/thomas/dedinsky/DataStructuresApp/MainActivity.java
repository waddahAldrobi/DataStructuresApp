package com.thomas.dedinsky.DataStructuresApp;

import android.app.Application;
import android.content.ContentValues;
import android.content.Intent;
import android.database.sqlite.SQLiteDatabase;
import android.databinding.DataBindingUtil;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Toast;

import com.thomas.dedinsky.DataStructuresApp.databinding.ActivityMainBinding;

class MyAppApplication extends Application {
    private String chapterName;
    public String getChapterName() {return chapterName;}
    public void setChapterName(String chapterName) {this.chapterName = chapterName;}
    private int lessonID;
    public int getLessonID() {return lessonID;}
    public void setLessonID(int lessonID) {this.lessonID = lessonID;}
}

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        saveToDB();
        MyAppApplication mApp = ((MyAppApplication)getApplicationContext());
        mApp.setChapterName("default");
        mApp.setLessonID(-1);
        startActivity(new Intent(MainActivity.this, com.thomas.dedinsky.DataStructuresApp.OverviewActivity.class));
    }

    private void saveToDB() {
        SQLiteDatabase database = new SampleDBSQLiteHelper(this).getWritableDatabase();
        ContentValues values = new ContentValues();
        values.put(SampleDBContract.Lesson.COLUMN_NAME, "jim");
        values.put(SampleDBContract.Lesson.COLUMN_CHAPTER, "jim");
        values.put(SampleDBContract.Lesson.COLUMN_SUMMARY, "jim");
        values.put(SampleDBContract.Lesson.COLUMN_CODE, "jim");

        long newRowId = database.insert(SampleDBContract.Lesson.TABLE_NAME, null, values);

        Toast.makeText(this, "The new Row Id is " + newRowId, Toast.LENGTH_LONG).show();
    }
}
