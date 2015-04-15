function setDataType(cValue)
  {
	var reg=/<.*>|\s|[↓↑—%,]|fenC\(|FormatAmt\(|\)/g;
	cValue=cValue.replace(reg, "");
    // THIS FUNCTION CONVERTS DATES AND NUMBERS FOR PROPER ARRAY
    // SORTING WHEN IN THE SORT FUNCTION
    var isDate = new Date(cValue);
    if (isDate == "NaN")
      {
        if (isNaN(cValue))
          {
            // THE VALUE IS A STRING, MAKE ALL CHARACTERS IN
            // STRING UPPER CASE TO ASSURE PROPER A-Z SORT
			isnum=false;
            cValue = cValue.toUpperCase();
            return cValue;
          }
        else
          {
            // VALUE IS A NUMBER, TO PREVENT STRING SORTING OF A NUMBER
            // ADD AN ADDITIONAL DIGIT THAT IS THE + TO THE LENGTH OF
            // THE NUMBER WHEN IT IS A STRING
            var myNum;
            myNum = cValue;
            return myNum;
          }
        }
  else
      {
        // VALUE TO SORT IS A DATE, REMOVE ALL OF THE PUNCTUATION AND
        // AND RETURN THE STRING NUMBER
        //BUG - STRING AND NOT NUMERICAL SORT .....
        // ( 1 - 10 - 11 - 2 - 3 - 4 - 41 - 5  etc.)
		isnum=false;
        var myDate = new String();
        myDate = isDate.getFullYear() + " " ;
		if(isDate.getMonth()<10)
			myDate = myDate +'0'+isDate.getMonth() + " ";
		else
			myDate = myDate + isDate.getMonth() + " ";
        if(isDate.getDate()<10)
			myDate = myDate +'0'+ isDate.getDate()+ " ";
		else
			myDate = myDate + isDate.getDate()+ " ";
		if(isDate.getHours()<10)
			myDate = myDate +'0'+ isDate.getHours() + " ";
		else
			myDate = myDate + isDate.getHours() + " ";
        if(isDate.getMinutes()<10)
			myDate = myDate +'0'+ isDate.getMinutes()+ " ";
		else
			myDate = myDate + isDate.getMinutes()+ " ";
		if(isDate.getSeconds()<10)
			myDate = myDate +'0'+isDate.getSeconds();
		else
			myDate = myDate + isDate.getSeconds();
        //myDate = String.fromCharCode(48 + myDate.length) + myDate;
        return myDate ;
      }
  }
var tempnum=-1;
var isnum=true;
//**************************************************************
//	页面排序
//	Creation date: (2007-11-26)	
//	@author: yangjing
//	@version: 1.0
//	@param：
//	@param：col tableToSort rw UorD
//	@param说明：
//	输入参数：col 设置排序是table的那列 tableToSort 排序表格 rw到数几行不用排序 UorD初始化是升序or降序 默认升序
//                前三个参数必须要
//	@condition：无
//	@调用样例
//**************************************************************
function sortTable(col, tableToSort,rw,UorD)
  {
    var iCurCell = col + tableToSort.cols;
    var totalRows = tableToSort.rows.length-rw;
    var bSort = 0;
    var colArray = new Array();
    var oldIndex = new Array();
    var indexArray = new Array();
    var bArray = new Array();
    var newRow;
    var newCell;
    var i;
    var c;
    var j;
	if(UorD==null)
		UorD=0;
    // ** POPULATE THE ARRAY colArray WITH CONTENTS OF THE COLUMN SELECTED
    for (i=1; i < totalRows; i++)
      {	
        colArray[i - 1] = setDataType(tableToSort.cells(iCurCell).innerText);
        iCurCell = iCurCell + tableToSort.cols;
      }
    // ** COPY ARRAY FOR COMPARISON AFTER SORT
    for (i=0; i < colArray.length; i++)
      {
        bArray[i] = colArray[i];
      }
    // ** SORT THE COLUMN ITEMS
    //alert ( colArray );
    if(isnum==true)
		colArray.sort(function(a,b){return   a-b;});//按升序排
	else
		colArray.sort();
	isnum=true;//恢复isnum
    //alert ( colArray );
    for (i=0; i < colArray.length; i++)
      { // LOOP THROUGH THE NEW SORTED ARRAY
        //indexArray[i] = (i+1);
        for(j=0; j < bArray.length; j++)
          { // LOOP THROUGH THE OLD ARRAY
            if (colArray[i] == bArray[j])
              {  // WHEN THE ITEM IN THE OLD AND NEW MATCH, PLACE THE
                // CURRENT ROW NUMBER IN THE PROPER POSITION IN THE
                // NEW ORDER ARRAY SO ROWS CAN BE MOVED ....
                // MAKE SURE CURRENT ROW NUMBER IS NOT ALREADY IN THE
                // NEW ORDER ARRAY
                for (c=0; c<i; c++)
                  {
                    if ( oldIndex[c] == (j+1) )
                    {
                      bSort = 1;
                    }
                      }
                      if (bSort == 0)
                        {
                          oldIndex[i] = (j+1);
                        }
                          bSort = 0;
                        }
          }
    }
  // ** SORTING COMPLETE, ADD NEW ROWS TO BASE OF TABLE ....
  if(tempnum==-1||tempnum!=col){
	  if(UorD==0){
	     for (i=oldIndex.length-1; i>=0; i--)
		    {
			newRow = tableToSort.insertRow();
			newRow.className=tableToSort.rows(oldIndex[i]).className;
			newRow.flag=tableToSort.rows(oldIndex[i]).flag;
			for (c=0; c<tableToSort.cols; c++)
				{
				newCell = newRow.insertCell();
				newCell.innerHTML = tableToSort.rows(oldIndex[i]).cells(c).innerHTML;
				}
			}
	  }
	  else{
		for (i=0; i<oldIndex.length; i++)
		{
		newRow = tableToSort.insertRow();
		newRow.className=tableToSort.rows(oldIndex[i]).className;
		newRow.flag=tableToSort.rows(oldIndex[i]).flag;
		for (c=0; c<tableToSort.cols; c++)
			{
			newCell = newRow.insertCell();
			newCell.innerHTML = tableToSort.rows(oldIndex[i]).cells(c).innerHTML;			
			}
		}
	  }

	tempnum=col;
  }
  else
	  {
	  if(UorD==0){
		for (i=0; i<oldIndex.length; i++)
		{
		newRow = tableToSort.insertRow();
		newRow.className=tableToSort.rows(oldIndex[i]).className;
		newRow.flag=tableToSort.rows(oldIndex[i]).flag;
		for (c=0; c<tableToSort.cols; c++)
			{
			newCell = newRow.insertCell();
			newCell.innerHTML = tableToSort.rows(oldIndex[i]).cells(c).innerHTML;			
			}
		}
	  }else{
		 for (i=oldIndex.length-1; i>=0; i--)
		    {
			newRow = tableToSort.insertRow();
			newRow.className=tableToSort.rows(oldIndex[i]).className;
			newRow.flag=tableToSort.rows(oldIndex[i]).flag;
			for (c=0; c<tableToSort.cols; c++)
				{
				newCell = newRow.insertCell();
				newCell.innerHTML = tableToSort.rows(oldIndex[i]).cells(c).innerHTML;
				}
			}
	  }
		tempnum=-1;
  }
  //MOVE NEW ROWS TO TOP OF TABLE ....
  for (i=1; i<totalRows; i++)
    {	
	    tableToSort.rows(i).className=tableToSort.rows(tableToSort.rows.length -i).className;
		 tableToSort.rows(i).flag=tableToSort.rows(tableToSort.rows.length -i).flag;
		for (c=0; c<tableToSort.cols; c++)
			{
			tableToSort.rows(i).cells(c).innerHTML=tableToSort.rows(tableToSort.rows.length -i).cells(c).innerHTML			
			}
	  
      //tableToSort.moveRow((tableToSort.rows.length -1),1);
    }
  //DELETE THE OLD ROWS FROM THE BOTTOM OF THE TABLE ....
  for (i=1; i<totalRows; i++)
    {	  
      tableToSort.deleteRow();
    }
  }
