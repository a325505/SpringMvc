
  /*通用对话框样式*/
  $.widget("ui.dialog", $.extend({}, $.ui.dialog.prototype, {
       _title : function(title) {
          if (!this.options.title) {
            title.html("&#160;");
          } else {
            title.html(this.options.title);
          }
        }
  }));



/* 表格翻页通用方法 */
function DT_page(tag,change,fliter,sort){
      var common_table = $('#'+tag).dataTable({
               "sPaginationType" : "bootstrap_full",
               "bAutoWidth":false,
               "bLengthChange": change,//改变每页显示数据数量
               "bFilter": fliter, //过滤功能
               "bSort": sort,//排序功能
               "oLanguage": {


                     "sZeroRecords": "抱歉， 没有找到",
                     "sInfo": "从 _START_ 到 _END_ /共 _TOTAL_ 条数据",
                     "sInfoEmpty": "没有数据",
                     "sInfoFiltered": "(从 _MAX_ 条数据中检索)",
                     "oPaginate": {  
                                "sFirst": "首页",  
                                "sPrevious": "上一页",  
                                "sNext": "下一页",  
                                "sLast": "尾页"  
                                 }  
                     },
                    "sZeroRecords": "没有检索到数据"
                 });
      return common_table;
}