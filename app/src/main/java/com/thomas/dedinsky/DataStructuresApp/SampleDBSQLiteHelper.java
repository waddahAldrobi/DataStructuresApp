package com.thomas.dedinsky.DataStructuresApp;

import android.content.Context;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;

public class SampleDBSQLiteHelper extends SQLiteOpenHelper {

    private static final int DATABASE_VERSION = 1;
    public static final String DATABASE_NAME = "sample_database";
    public static final String PREFERENCES = "preferences";

    public SampleDBSQLiteHelper(Context context) {
        super(context, DATABASE_NAME, null, DATABASE_VERSION);
    }

    @Override
    public void onCreate(SQLiteDatabase sqLiteDatabase) {
        sqLiteDatabase.execSQL(SampleDBContract.Lesson.CREATE_TABLE);
        sqLiteDatabase.execSQL("CREATE TABLE IF NOT EXISTS " + PREFERENCES + "(theme TEXT)");
    }

    @Override
    public void onUpgrade(SQLiteDatabase sqLiteDatabase, int i, int i1) {
        sqLiteDatabase.execSQL("DROP TABLE IF EXISTS " + SampleDBContract.Lesson.TABLE_NAME);
        sqLiteDatabase.execSQL("DROP TABLE IF EXISTS " + PREFERENCES);
        onCreate(sqLiteDatabase);
    }
}
