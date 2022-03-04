console.log("hanndnjbjhadb");
$( document ).ready(function() {
    $("#addpatient").click(function(e) {
        console.log("hammad")
        e.preventDefault();
        $.ajax({
            type: "get",
            url: "/patients/new/",
            dataType:"script",
        });
    });
});
