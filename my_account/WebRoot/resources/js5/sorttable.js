//column index for sort
 var indexCol;
 //�ȽϺ���������Array.sort()����ʱ�Ƚ��á�
 //�������Ƚ�����Ԫ��array1[indexCol]��Ԫ��array2[indexCol]Unicodeֵ�Ĵ�С
 function arrayCompare(array1,array2){
  //alert(array1.length+"--"+array1[indexCol]);
 /** if (array1[indexCol] < array2[indexCol])
   return -1;
  if (array1[indexCol] > array2[indexCol])
   return 1;
  
  return 0;
  */
	return array1[indexCol].localeCompare(array2[indexCol]);
 
 }
  //ȥ�� ","

function getoff_Qfw(cash){
    var len=cash.length;
    var ch="";
    var newCash="";
	var newttt="0"
    for (var ii=0;ii<len;ii++){
        ch=cash.charAt(ii);
        if (ch!=","){newCash=newCash+ch;}
    }
    return newCash;
}
 //var reg=/<.,*>|\s|[������%]/g;
 //�Ƚ�����Ԫ��array1[indexCol]��Ԫ��array2[indexCol]����ֵ��С
 function arrayCompareNumber(array1,array2){
  //alert("����һ��");
  if (parseFloat(getoff_Qfw(array1[indexCol])) < parseFloat(getoff_Qfw(array2[indexCol])))
   return -1;
  if (parseFloat(getoff_Qfw(array1[indexCol])) > parseFloat(getoff_Qfw(array2[indexCol])))
   return 1;
  
  return 0;
 }

 //��arrayCompare�෴��ʽ�Ƚϴ�С�����ڵ���ʹ��
 function arrayCompareRev(array1,array2){
  
  /**if (array1[indexCol] < array2[indexCol])
   return 1;
  if (array1[indexCol] > array2[indexCol])
   return -1;
  
  return 0;
  */
	return array2[indexCol].localeCompare(array1[indexCol]);
 }
 //��arrayCompareNumber�෴��ʽ�Ƚϴ�С�����ڵ���ʹ��
 function arrayCompareNumberRev(array1,array2){
	 //alert("���ڶ���");
  if (parseFloat(getoff_Qfw(array1[indexCol])) < parseFloat(getoff_Qfw(array2[indexCol])))
   return 1;
  if (parseFloat(getoff_Qfw(array1[indexCol])) > parseFloat(getoff_Qfw(array2[indexCol])))
   return -1;
  
  return 0;
 }
 
 //define a 2-dimension array 
 function BiArray(rows,cols){
  
  //simulate multidimension array
  this.rows = rows;
  this.cols = cols;
  
  //construct array
  var lines = new Array(rows);
  for(var i = 0;i < lines.length; i++){
   lines[i] = new Array(cols);
  }
  
  
  // ����������(i,j)��Ԫ��ֵΪvalue
  this.setElement = function(i,j,value){ lines[i][j] = value; };
  
  // ��ȡ������(i,j)��Ԫ�ص�ֵ
  this.getElement = function(i,j){return lines[i][j];};
  
  // ���������i�����ڵ�����
  this.getLine = function(i){return lines[i];};
  
  // ���ݵ�j���ַ�����ֵ,��������н�������,������Ϊ����
  this.sortLine = function(j){
       indexCol = j;
       lines.sort(arrayCompare);
      };
  
  // ���ݵ�j����ֵ��ֵ,��������н�������,������Ϊ����
  this.sortLineByNumber = function(j){
       indexCol = j;
       lines.sort(arrayCompareNumber);
      };
  
  // ���ݵ�j���ַ�����ֵ,��������н�������,������Ϊ����
  this.sortLineRev = function(j){
       indexCol = j;
       lines.sort(arrayCompareRev);
      };
  
  // ���ݵ�j����ֵ��ֵ,��������н�������,������Ϊ����
  this.sortLineByNumberRev = function(j){
       indexCol = j;
       lines.sort(arrayCompareNumberRev);
      };
  //����ά����תΪ�ַ�����ʽ
  this.toString = function(){
       var rst ="";
       for(var i = 0; i < lines.length; i++){
        for(var j = 0; j < lines[i].length; j++){
         rst += lines[i][j];
         rst += '\t';
        }
        rst += '\n';
       }
       return rst;
      };
 } // end of BiArray define
//ascending or descending 
 var asce = true;

 /**
  �Ա����ָ����Χ�����ݽ�������
  tableId    Ҫ����ı���id,ֵ��ʽΪ <table id="tb1" >
  sortCol    ����������к�,��1��ʼ����
  compareType   ����ʱ�ȽϷ�ʽ��s-���ַ����Ƚ�,n-����ֵ�Ƚ�
  startRow   ����Χ��ʼ�к�,��1��ʼ����
  endRow     ����Χ�����к�,��1��ʼ����
  startCol   ����Χ��ʼ�к�,��1��ʼ����
  endCol     ����Χ�����к�,��1��ʼ����
 */
 function sortTableInRange(tableId,sortCol,compareType,startRow,endRow,startCol,endCol){
  try{
   var table = document.getElementById(tableId);
   // get all row object of the table
   var objRows = table.getElementsByTagName("tr");
   endRow = (endRow < objRows.length ? endRow : objRows.length);
   var sortRows = endRow - startRow + 1;
   if (sortRows < 2) //only one line,don't sort
    return ;
   endCol = (endCol < objRows[1].getElementsByTagName("td").length ? endCol :
     objRows[1].getElementsByTagName("td").length);
   var cols = endCol - startCol + 1;
    
   // define a array to store table cell and sort them
   var tabData = new BiArray(sortRows,cols);
   var ari = 0;
   // retrived table cell data save to array
   for(i = startRow - 1; i < endRow; i++){
    //retrived all <td> cell
    var cells = objRows[i].getElementsByTagName("td");
    var arj = 0;
    for(var j = startCol - 1; j < endCol; j++){
     tabData.setElement(ari,arj,cells.item(j).innerHTML);
     arj++;
    }
    ari++;
   }
   if (asce){
    if (compareType == "n" || compareType == 'N')
     tabData.sortLineByNumber(sortCol- startCol);
    else
     tabData.sortLine(sortCol - startCol);
    asce = false;
   }else{
    if (compareType == "n" || compareType == 'N')
     tabData.sortLineByNumberRev(sortCol - startCol);
    else
     tabData.sortLineRev(sortCol - startCol);
    asce = true;
   }
   ari = 0;
   //update table data with array
   for(i = startRow -1; i < endRow; i++){
    //retrived all <td> cell
    var cells = objRows[i].getElementsByTagName("td");
    arj = 0;
    for(var j = startCol - 1; j < endCol; j++){
     cells.item(j).innerHTML = tabData.getElement(ari,arj);
     arj++;
    }
    ari++;
   }
  }catch(e){
   alert(e);
  }
 }