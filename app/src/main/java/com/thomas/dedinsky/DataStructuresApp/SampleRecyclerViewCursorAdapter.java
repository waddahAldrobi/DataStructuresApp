package com.thomas.dedinsky.DataStructuresApp;

import android.content.Context;
import android.content.Intent;
import android.database.Cursor;
import android.databinding.DataBindingUtil;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import com.thomas.dedinsky.DataStructuresApp.databinding.EmployerListItemBinding;

public class SampleRecyclerViewCursorAdapter extends RecyclerView.Adapter<SampleRecyclerViewCursorAdapter.ViewHolder> {

    MyAppApplication mApp;
    Context mContext;
    Cursor mCursor;
    Boolean mIsChapter;
    String name;
    int id;

    public SampleRecyclerViewCursorAdapter(MyAppApplication myApp, Context context, Cursor cursor, Boolean isChapter) {
        mApp = myApp;
        mContext = context;
        mCursor = cursor;
        mIsChapter = isChapter;
    }

    public class ViewHolder extends RecyclerView.ViewHolder {
        EmployerListItemBinding itemBinding;

        public ViewHolder(View itemView) {
            super(itemView);
            itemBinding = DataBindingUtil.bind(itemView);
            itemBinding.nextButton.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View view) {
                    if (mIsChapter) {
                        mApp.setLessonID(id);
                        Intent i = new Intent(mContext,LessonActivity.class);
                        mContext.startActivity(i);
                    } else {
                        mApp.setChapterName(name);
                        Intent i = new Intent(mContext,ChapterActivity.class);
                        mContext.startActivity(i);
                    }
                }
            });

        }

        public void bindCursor(Cursor cursor) {
            if (mIsChapter) {
                name = cursor.getString(cursor.getColumnIndexOrThrow(SampleDBContract.Lesson.COLUMN_NAME));
                id = cursor.getInt(cursor.getColumnIndexOrThrow(SampleDBContract.Lesson._ID));
            } else {
                name = cursor.getString(cursor.getColumnIndexOrThrow(SampleDBContract.Lesson.COLUMN_CHAPTER));
            }
            itemBinding.nameLabel.setText(name);
        }
    }

    @Override
    public int getItemCount() {
        return mCursor.getCount();
    }

    @Override
    public void onBindViewHolder(ViewHolder holder, int position) {
        mCursor.moveToPosition(position);
        holder.bindCursor(mCursor);
    }

    @Override
    public ViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        View view = LayoutInflater.from(parent.getContext()).inflate(
                R.layout.employer_list_item, parent, false);
        ViewHolder viewHolder = new ViewHolder(view);
        return viewHolder;
    }
}