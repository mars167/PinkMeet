function initUploader(imgObj,destination){
    var uploader = new LUploader(pic, {
        url: destination,//post请求地址
        multiple: false,//是否一次上传多个文件 默认false
        maxsize: 102400,//忽略压缩操作的文件体积上限 默认100kb
        accept: 'image/*',//可上传的图片类型
        quality: 0.5,//压缩比 默认0.1  范围0.1-1.0 越小压缩率越大
        showsize:false//是否显示原始文件大小 默认false
    });

    document.getElementById('upload-btn').addEventListener('click', function() {
        setTimeout(check,500);
    });
}
function check(){
    var html = document.getElementById('preview').innerHTML;
    if( html.indexOf("上传成功") >= 0 ){
        window.location.replace("info.html");
    }
}