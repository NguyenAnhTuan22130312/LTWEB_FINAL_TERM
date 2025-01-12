function optionOrder(param){
    $.ajax({
        url: "PurchaseOrderAjax",
        type:"get",
        data: {
            optionOrder : param
        },
        success: function (data){
            var row = document.getElementById("content_section");
            row.innerHTML = data;

        }
    })
}