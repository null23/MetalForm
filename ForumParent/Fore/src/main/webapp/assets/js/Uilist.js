var title = 'resultimg';
var b;
var a;
var url;
var id;
var imgtype = 1;
var list = $("#father").val();
var imgurl=[];
layui.use([ 'element', 'form', 'upload','layer' ], function() {
	var $ = layui.jquery;
	var element = layui.element();
	 var layer = layui.layer;
	form = layui.form();
	form.on('checkbox(allChoose)', function(data) {
		var child = $(data.elem).parents('table').find(
				'tbody input[type="checkbox"]');
		child.each(function(index, item) {
			item.checked = data.elem.checked;
		});
		form.render('checkbox');
	});
	var layid = location.hash.replace(/^test=/, '');
	element.tabChange('docDemo', layid);
	element.on('tab(docDemo)', function(elem) {
		title = $(this).attr('lay-id');
		if (title == 'resultimg') {

			imgtype = 1;
		} else if (title == 'sizeimg') {

			imgtype = 2;
		} else if (title == 'materialimg') {

			imgtype = 3;
		}
	});
});
$(function() {
	var c;
	$(this).find(".bg").removeClass("bg-blur");
	$(this).find(".content").hide();
	$(".div").click(function() {
		if ($(this).find(".content").is(":hidden")) {
			$(this).find(".bg").addClass("bg-blur");
			$(this).find(".content").show();
		    var bg= $(this).find(".bg")[0].src;
		    var index=bg.lastIndexOf("/");
		    c=bg.slice(index+1);
		    $("#myforms").append("<input id='"+c+"' name='aa' value='"+c+"' type='hidden' />");
		} else {
			$(this).find(".bg").removeClass("bg-blur");
			$(this).find(".content").hide();
			$("#"+c).remove();
		}
	});
});
function download(){
	if($("#myforms").children().length==0){
		layer.msg("至少选择一个文件");
	}else{
		$.ajax({
			url : "../ui/download.action",
			type : 'post',
			data : $('#myforms').serialize(),
			success:function (data){
				var last=data.lastIndexOf("/");
				var aaa=data.slice(last+1);
				window.location.href="../zip/"+aaa;
			}
		});
	}
	
}
function addresult(b) {
	$("#resultdiv")
			.before(
					"<div class='img' style='display: inline-block;margin-top: 20px;margin-left: 10px;margin-bottom: 50px;'><img src='../upload/"
							+ b.filename
							+ "' /><input type='text' id='"
							+ b.id
							+ "' name='annotation' style='width: 300px;margin: 0 auto;margin-top: 5px;' lay-verify='required' placeholder='请输入注释' onblur=\"upload('"
							+ b.id
							+ "')\" autocomplete='off' class='layui-input resultannotation'></div>");
}

function addsize(b) {
	$("#sizediv")
			.before(
					"<div class='img' style='display: inline-block;margin-top: 20px;margin-left: 10px;margin-bottom: 50px;'><img src='../upload/"
							+ b.filename
							+ "' /><input type='text'  id='"
							+ b.id
							+ "' name='annotation' style='width: 300px;margin: 0 auto;margin-top: 5px;' lay-verify='required' placeholder='请输入注释' onblur=\"upload('"
							+ b.id
							+ "')\" autocomplete='off' class='layui-input sizeannotation'></div>");
}

function addmaterial(b) {
	$("#materialdiv")
			.before(
					"<div class='materialimg' style='display: inline-block;margin-top: 15px;margin-left: 15px;'><div style='width:200px;height:200px;border: 2px dashed #CCCCCC;position:relative;'><img src='../upload/"
							+ b.filename
							+ "' style='max-width: 200px;max-height: 200px;position: absolute;left:0;right:0;top:0;bottom:0;margin:auto;' /><br /></div><input type='text' id='"
							+ b.id
							+ "' name='annotation' style='width: 180px;margin: 0 auto;margin-top: 5px;' lay-verify='required' placeholder='请输入注释' onblur=\"upload('"
							+ b.id
							+ "')\" autocomplete='off' class='layui-input materialannotation'></div>");
	$(this).find(".bg").removeClass("bg-blur");
	$(this).find(".content").hide();
	$(".div").click(function() {
		if ($(this).find(".content").is(":hidden")) {
			$(this).find(".bg").addClass("bg-blur");
			$(this).find(".content").show();
		    var bg= $(this).find(".bg")[0].src;
		    alert(bg);
		    $("#myforms").append("<input id='"+c+"' name='aa' value='"+bg+"' type='hidden' />");
		} else {
			$(this).find(".bg").removeClass("bg-blur");
			$(this).find(".content").hide();
			$("#"+c).remove();
			
		}
	});
}
function upload(id) {
	var i = id;
	var annotations = $("#" + i).val();
	$.ajax({
		url : "../ui/save.action",
		type : 'post',
		data : {
			annotation : annotations,
			id : id
		},
	});
}
var dropresult = document.getElementById('dropresult');
var dropsize = document.getElementById('dropsize');
var dropmaterial = document.getElementById('dropmaterial');

if (!(('draggable' in dropresult) && ('ondragenter' in dropresult)
		&& ('ondragleave' in dropresult) && ('ondragover' in dropresult) && window.File)) {
} else if (!(('draggable' in dropmaterial) && ('ondragenter' in dropmaterial)
		&& ('ondragleave' in dropmaterial) && ('ondragover' in dropmaterial) && window.File)) {
} else if (!(('draggable' in dropsize) && ('ondragenter' in dropsize)
		&& ('ondragleave' in dropsize) && ('ondragover' in dropsize) && window.File)) {
} else {
	function handleFileDragEnter(e) {
		e.stopPropagation();
		e.preventDefault();
		this.classList.add('hovering');
	}

	function handleFileDragLeave(e) {
		e.stopPropagation();
		e.preventDefault();
		this.classList.remove('hovering');
	}

	function handleFileDragOver(e) {
		e.stopPropagation();
		e.preventDefault();
		e.dataTransfer.dropEffect = 'copy';
	}

	function handleFileDrop(e) {
		e.stopPropagation();
		e.preventDefault();
		this.classList.remove('hovering');

		var files = e.dataTransfer.files;
		var outputStr = [];
		for (var i = 0, f; f = files[i]; i++) {
			if (f.type.indexOf('image') === -1) {
				alert("您拖的不是图片！");
				return false;
			} else {
				xhr = new XMLHttpRequest();
				xhr.open("POST", "../ui/upload.action", true);
				xhr.setRequestHeader("X-Requested-With", "XMLHttpRequest");
				xhr.onreadystatechange = zswFun;
				function zswFun() {
					if (xhr.readyState == 4 && xhr.status == 200) {
						b = xhr.responseText;
						var c = JSON.parse(b);
						if (title == 'resultimg') {
							addresult(c);
						} else if (title == 'sizeimg') {
							addsize(c);
						} else if (title == 'materialimg') {
							addmaterial(c);
						}
					}
				}
				var fd = new FormData();
				fd.append("mypic", f);
				fd.append("list", list);
				fd.append("imgtype", imgtype);
				xhr.send(fd);
			}
		}
	}

	dropresult.addEventListener('dragenter', handleFileDragEnter, false);
	dropresult.addEventListener('dragleave', handleFileDragLeave, false);
	dropresult.addEventListener('dragover', handleFileDragOver, false);
	dropresult.addEventListener('drop', handleFileDrop, false);
	dropmaterial.addEventListener('dragenter', handleFileDragEnter, false);
	dropmaterial.addEventListener('dragleave', handleFileDragLeave, false);
	dropmaterial.addEventListener('dragover', handleFileDragOver, false);
	dropmaterial.addEventListener('drop', handleFileDrop, false);
	dropsize.addEventListener('dragenter', handleFileDragEnter, false);
	dropsize.addEventListener('dragleave', handleFileDragLeave, false);
	dropsize.addEventListener('dragover', handleFileDragOver, false);
	dropsize.addEventListener('drop', handleFileDrop, false);

}
