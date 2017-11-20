package com.thomas.dedinsky.DataStructuresApp;

import android.provider.BaseColumns;

public final class SampleDBContract {

    private SampleDBContract() {
    }

    public static class Lesson implements BaseColumns {
        public static final String TABLE_NAME = "lesson";
        public static final String COLUMN_NAME = "name";
        public static final String COLUMN_CHAPTER = "chapter";
        public static final String COLUMN_SUMMARY = "summary";
        public static final String COLUMN_CODE = "code";

        public static final String CREATE_TABLE = "CREATE TABLE IF NOT EXISTS " +
                TABLE_NAME + " (" +
                _ID + " INTEGER PRIMARY KEY AUTOINCREMENT, " +
                COLUMN_NAME + " TEXT, " +
                COLUMN_CHAPTER + " TEXT, " +
                COLUMN_SUMMARY + " TEXT, " +
                COLUMN_CODE + " TEXT)";
    }
}
