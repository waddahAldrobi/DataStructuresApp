package com.thomas.dedinsky.DataStructuresApp;

import android.app.Application;
import android.content.ContentValues;
import android.content.Context;
import android.content.Intent;
import android.content.res.AssetManager;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.databinding.DataBindingUtil;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Toast;
import org.json.*;

import com.thomas.dedinsky.DataStructuresApp.databinding.ActivityMainBinding;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.Iterator;

class MyAppApplication extends Application {
    private String chapterName;
    public String getChapterName() {return chapterName;}
    public void setChapterName(String chapterName) {this.chapterName = chapterName;}
    private int lessonID;
    public int getLessonID() {return lessonID;}
    public void setLessonID(int lessonID) {this.lessonID = lessonID;}
}

public class MainActivity extends AppCompatActivity {

    private ActivityMainBinding binding;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        MyAppApplication mApp = ((MyAppApplication)getApplicationContext());
        mApp.setChapterName("default");
        mApp.setLessonID(-1);
        checkData();
        binding = DataBindingUtil.setContentView(this, R.layout.activity_main);
        binding.firstActivityButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                startActivity(new Intent(MainActivity.this, com.thomas.dedinsky.DataStructuresApp.OverviewActivity.class));
            }
        });
        binding.firstActivityButton.setVisibility(View.VISIBLE);
        startActivity(new Intent(MainActivity.this, com.thomas.dedinsky.DataStructuresApp.OverviewActivity.class));
    }

    protected void checkData() {
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
        Cursor cursor = database.rawQuery("SELECT count(*) FROM "+SampleDBContract.Lesson.TABLE_NAME, null);
        cursor.moveToFirst();
        int count = cursor.getInt(0);
        Log.d("meme", Integer.toString(count));
        if (count == 0) {
            try {
                readJSON();
            } catch (IOException e) {
                e.printStackTrace();
            } catch (JSONException e) {
                e.printStackTrace();
            }
        }
    }

    protected void readJSON() throws IOException, JSONException {
        AssetManager assetManager = getApplicationContext().getAssets();
        InputStream inputStream = assetManager.open("DataStructuresTest.txt");
        InputStreamReader inputStreamReader = new InputStreamReader(inputStream);
        BufferedReader reader = new BufferedReader(inputStreamReader);
        String json = "";
        StringBuilder sb = new StringBuilder();
        String line = reader.readLine();
        while (line != null) {
            sb.append(line);
            sb.append("\n");
            line = reader.readLine();
        }
        json = sb.toString();
        reader.close();
        Log.d("JSON", json);
        if (json != "") {
            SQLiteDatabase database = new SampleDBSQLiteHelper(this).getWritableDatabase();
            JSONObject obj = new JSONObject(json);
            JSONArray array= obj.getJSONArray("data");
            for(int i = 0; i < array.length(); i++){
                ContentValues values = new ContentValues();
                JSONObject row = array.getJSONObject(i);
                Log.d("JSON", row.getString("name"));
                values.put(SampleDBContract.Lesson.COLUMN_NAME, row.getString("name"));
                values.put(SampleDBContract.Lesson.COLUMN_CHAPTER, row.getString("chapter"));
                values.put(SampleDBContract.Lesson.COLUMN_SUMMARY, row.getString("summary"));
                values.put(SampleDBContract.Lesson.COLUMN_CODE, row.getString("code"));
                database.insert(SampleDBContract.Lesson.TABLE_NAME, null, values);
                //Toast.makeText(this, "The new Row Id is " + newRowId, Toast.LENGTH_LONG).show();
            }
        }
    }
}
