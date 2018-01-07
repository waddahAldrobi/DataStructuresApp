package com.thomas.dedinsky.DataStructuresApp;

import android.content.ContentValues;
import android.content.pm.ActivityInfo;
import android.content.res.Configuration;
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

import io.github.kbiakov.codeview.CodeView;
import io.github.kbiakov.codeview.highlight.ColorTheme;

public class LessonActivity extends AppCompatActivity {

    private LinearLayout contentTop;
    private LinearLayout contentBottom;
    private LinearLayout sectionRegCode;
    private LinearLayout sectionVisCode;
    private LinearLayout sectionTopSum;
    private LinearLayout sectionBottomSum;
    private CodeView regCodeView;
    private CodeView visCodeView;
    private TextView topSumText;
    private TextView bottomSumText;
    private static final String TAG = "LessonActivity";
    protected String name;
    protected String summary;
    protected String code;
    protected int orientation;
    private boolean hasVis = false;
    private boolean hasCode = false;
    protected String testImage = "image";
    protected String testRegCode = "#include <iostream>\n" +
            "using namespace std;\n" +
            "int main(){\n" +
            "int var1 = 25;   // the “&” accesses memory\n" +
            "int *ptr1 = &var1;    // pointer in stack \n" +
            "\n" +
            "// Both of these methods are pointers in heap \n" +
            "int *ptr2 = new int;\n" +
            "*ptr2 = 5;\n" +
            "// OR\n" +
            "int *ptr2 = new int(5);\n" +
            "\n" +
            "// Deleting heap pointer\n" +
            "delete ptr2 ; \n" +
            "delete [] ptr2 ;    // If pointer is an array\n" +
            "int var1 = 25;   // the “&” accesses memory\n" +
            "int *ptr1 = &var1;    // pointer in stack \n" +
            "\n" +
            "// Both of these methods are pointers in heap \n" +
            "int *ptr2 = new int;\n" +
            "*ptr2 = 5;\n" +
            "// OR\n" +
            "int *ptr2 = new int(5);\n" +
            "\n" +
            "// Deleting heap pointer\n" +
            "delete ptr2 ; \n" +
            "delete [] ptr2 ;    // If pointer is an array\n" +
            "int var1 = 25;   // the “&” accesses memory\n" +
            "int *ptr1 = &var1;    // pointer in stack \n" +
            "\n" +
            "// Both of these methods are pointers in heap \n" +
            "int *ptr2 = new int;\n" +
            "*ptr2 = 5;\n" +
            "// OR\n" +
            "int *ptr2 = new int(5);\n" +
            "\n" +
            "// Deleting heap pointer\n" +
            "delete ptr2 ; \n" +
            "delete [] ptr2 ;    // If pointer is an array\n" +
            "}";
    protected String testVisCode = "#include <iostream>";

    private BottomNavigationView.OnNavigationItemSelectedListener mOnNavigationItemSelectedListener
            = new BottomNavigationView.OnNavigationItemSelectedListener() {

        @Override
        public boolean onNavigationItemSelected(@NonNull MenuItem item) {
            LinearLayout.LayoutParams lpBottom = (LinearLayout.LayoutParams) contentBottom.getLayoutParams();
            LinearLayout.LayoutParams lpRegCode = (LinearLayout.LayoutParams) sectionRegCode.getLayoutParams();
            LinearLayout.LayoutParams lpVisCode = (LinearLayout.LayoutParams) sectionVisCode.getLayoutParams();
            LinearLayout.LayoutParams lpTopSum = (LinearLayout.LayoutParams) sectionTopSum.getLayoutParams();
            LinearLayout.LayoutParams lpBottomSum = (LinearLayout.LayoutParams) sectionBottomSum.getLayoutParams();
            switch (item.getItemId()) {
                case R.id.navigation_home:
                    topSumText.setText(summary);
                    bottomSumText.setText(summary);
                    lpRegCode.weight = 0;
                    sectionRegCode.setLayoutParams(lpRegCode);
                    lpVisCode.weight = 0;
                    sectionVisCode.setLayoutParams(lpVisCode);
                    lpTopSum.weight = 1;
                    sectionTopSum.setLayoutParams(lpTopSum);
                    lpBottomSum.weight = 0;
                    sectionBottomSum.setLayoutParams(lpBottomSum);
                    lpBottom.weight = 0;
                    contentBottom.setLayoutParams(lpBottom);
                    return true;
                case R.id.navigation_dashboard:
                    topSumText.setText(testImage);
                    bottomSumText.setText(testImage);
                    lpRegCode.weight = 0;
                    sectionRegCode.setLayoutParams(lpRegCode);
                    lpVisCode.weight = 1;
                    sectionVisCode.setLayoutParams(lpVisCode);
                    if (orientation == Configuration.ORIENTATION_LANDSCAPE) {
                        lpTopSum.weight = 1;
                        sectionTopSum.setLayoutParams(lpTopSum);
                        lpBottomSum.weight = 0;
                        sectionBottomSum.setLayoutParams(lpBottomSum);
                        lpBottom.weight = 0;
                        contentBottom.setLayoutParams(lpBottom);
                    } else {
                        lpTopSum.weight = 0;
                        sectionTopSum.setLayoutParams(lpTopSum);
                        lpBottomSum.weight = 1;
                        sectionBottomSum.setLayoutParams(lpBottomSum);
                        lpBottom.weight = 1;
                        contentBottom.setLayoutParams(lpBottom);
                    }
                    if (!hasVis) {
                        hasVis = true;
                        visCodeView.setCode(testVisCode, "cpp");
                    }
                    return true;
                case R.id.navigation_notifications:
                    topSumText.setText(summary);
                    bottomSumText.setText(summary);
                    lpRegCode.weight = 1;
                    sectionRegCode.setLayoutParams(lpRegCode);
                    lpVisCode.weight = 0;
                    sectionVisCode.setLayoutParams(lpVisCode);
                    lpTopSum.weight = 0;
                    sectionTopSum.setLayoutParams(lpTopSum);
                    lpBottomSum.weight = 0;
                    sectionBottomSum.setLayoutParams(lpBottomSum);
                    lpBottom.weight = 0;
                    contentBottom.setLayoutParams(lpBottom);
                    if (!hasCode) {
                        hasCode = true;
                        regCodeView.setCode(testRegCode, "cpp");
                        regCodeView.getOptions().setTheme(ColorTheme.MONOKAI);
                    }
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
        orientation = getResources().getConfiguration().orientation;
        contentTop = (LinearLayout) findViewById(R.id.contentTop);
        contentBottom = (LinearLayout) findViewById(R.id.contentBottom);
        sectionRegCode = (LinearLayout) findViewById(R.id.sectionRegCode);
        sectionVisCode = (LinearLayout) findViewById(R.id.sectionVisCode);
        sectionTopSum = (LinearLayout) findViewById(R.id.sectionTopSum);
        sectionBottomSum = (LinearLayout) findViewById(R.id.sectionBottomSum);
        regCodeView = (CodeView) findViewById(R.id.reg_code_view);
        visCodeView = (CodeView) findViewById(R.id.vis_code_view);
        topSumText = (TextView) findViewById(R.id.top_sum_text);
        bottomSumText = (TextView) findViewById(R.id.bottom_sum_text);
        topSumText.setText(summary);
        bottomSumText.setText(summary);
        BottomNavigationView navigation = (BottomNavigationView) findViewById(R.id.navigation);
        navigation.setOnNavigationItemSelectedListener(mOnNavigationItemSelectedListener);
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
