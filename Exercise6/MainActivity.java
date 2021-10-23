package com.example.exercise_6;

import android.app.Activity;
import android.app.AlertDialog.Builder;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.os.Bundle;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.EditText;

public class MainActivity extends Activity implements OnClickListener
{
    EditText BookNumber, BookName, Cost;
    Button Insert,Delete,Update,View,ViewAll;
    SQLiteDatabase db;
    /** Called when the activity is first created. */
    @Override
    public void onCreate(Bundle savedInstanceState)
    {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        BookNumber=(EditText)findViewById(R.id.BookNumber);
        BookName=(EditText)findViewById(R.id.BookName);
        Cost=(EditText)findViewById(R.id.Cost);
        Insert=(Button)findViewById(R.id.Insert);
        Delete=(Button)findViewById(R.id.Delete);
        Update=(Button)findViewById(R.id.Update);
        View=(Button)findViewById(R.id.View);
        ViewAll=(Button)findViewById(R.id.ViewAll);

        Insert.setOnClickListener(this);
        Delete.setOnClickListener(this);
        Update.setOnClickListener(this);
        View.setOnClickListener(this);
        ViewAll.setOnClickListener(this);

        // Creating database and table
        db=openOrCreateDatabase("BookDB", Context.MODE_PRIVATE, null);
        db.execSQL("CREATE TABLE IF NOT EXISTS book(booknumber VARCHAR,bookname VARCHAR,cost VARCHAR);");
    }
    public void onClick(View view)
    {
        // Inserting a record to the Book table
        if(view==Insert)
        {
            // Checking for empty fields
            if(BookNumber.getText().toString().trim().length()==0||
                    BookName.getText().toString().trim().length()==0||
                    Cost.getText().toString().trim().length()==0)
            {
                showMessage("Error", "Please enter all values");
                return;
            }
            db.execSQL("INSERT INTO book VALUES('"+BookNumber.getText()+"','"+BookName.getText()+
                    "','"+Cost.getText()+"');");
            showMessage("Success", "Record added");
            clearText();
        }
        // Deleting a record from the Book table
        if(view==Delete)
        {
            // Checking for empty roll number
            if(BookNumber.getText().toString().trim().length()==0)
            {
                showMessage("Error", "Please enter BookNumber");
                return;
            }
            Cursor c=db.rawQuery("SELECT * FROM book WHERE booknumber='"+BookNumber.getText()+"'", null);
            if(c.moveToFirst())
            {
                db.execSQL("DELETE FROM book WHERE booknumber='"+BookNumber.getText()+"'");
                showMessage("Success", "Record Deleted");
            }
            else
            {
                showMessage("Error", "Invalid BookNumber");
            }
            clearText();
        }
        // Updating a record in the Book table
        if(view==Update)
        {
            // Checking for empty book number
            if(BookNumber.getText().toString().trim().length()==0)
            {
                showMessage("Error", "Please enter BookNumber");
                return;
            }
            Cursor c=db.rawQuery("SELECT * FROM book WHERE booknumber='"+BookNumber.getText()+"'", null);
            if(c.moveToFirst()) {
                db.execSQL("UPDATE book SET bookname='" + BookName.getText() + "',cost='" + Cost.getText() +
                        "' WHERE booknumber='"+BookNumber.getText()+"'");
                showMessage("Success", "Record Modified");
            }
            else {
                showMessage("Error", "Invalid BookNumber");
            }
            clearText();
        }
        // Display a record from the Book table
        if(view==View)
        {
            // Checking for empty roll number
            if(BookNumber.getText().toString().trim().length()==0)
            {
                showMessage("Error", "Please enter BookNumber");
                return;
            }
            Cursor c=db.rawQuery("SELECT * FROM book WHERE booknumber='"+BookNumber.getText()+"'", null);
            if(c.moveToFirst())
            {
                BookName.setText(c.getString(1));
                Cost.setText(c.getString(2));
            }
            else
            {
                showMessage("Error", "Invalid BookNumber");
                clearText();
            }
        }
        // Displaying all the records
        if(view==ViewAll)
        {
            Cursor c=db.rawQuery("SELECT * FROM book", null);
            if(c.getCount()==0)
            {
                showMessage("Error", "No records found");
                return;
            }
            StringBuffer buffer=new StringBuffer();
            while(c.moveToNext())
            {
                buffer.append("BookNo: "+c.getString(0)+"\n");
                buffer.append("BookName: "+c.getString(1)+"\n");
                buffer.append("Cost: "+c.getString(2)+"\n\n");
            }
            showMessage("Book Details", buffer.toString());
        }
    }
    public void showMessage(String title,String message)
    {
        Builder builder=new Builder(this);
        builder.setCancelable(true);
        builder.setTitle(title);
        builder.setMessage(message);
        builder.show();
    }
    public void clearText()
    {
        BookNumber.setText("");
        BookName.setText("");
        Cost.setText("");
        BookNumber.requestFocus();
    }
}