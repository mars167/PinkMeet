/*
 * LUploader图片压缩上传插件
 * 
 * 作者：黄磊
 * 
 * 报告漏洞，意见或建议, 请联系邮箱：xfhxbb@yeah.net
 * 
 * 创建于：2016年3月16日
 * 
 * Copyright 2016
 *
 * 获得使用本类库的许可, 您必须保留著作权声明信息。
 * 
 * https://github.com/xfhxbb/LUploader
 *
 */
(function() {
    window.LUploader = function(el, params) {
        var _self = this;
        _self.trigger=el;
        _self.params = {
            accept: 'image/*',
            multiple: false,
            maxsize: 102400,
            imgObj: {},
            showsize: false,
            quality:0.1,
            url: ''
        }
        for (var param in params) {
            _self.params[param] = params[param];
        }
        _self.init();
    };
    LUploader.prototype.init = function() {
        var _self = this;
        _self.trigger.setAttribute('accept', _self.params.accept);
        _self.params.multiple && _self.trigger.setAttribute('multiple', '');

        var select = document.querySelector('#' + _self.trigger.getAttribute('data-Selector'));
        select.addEventListener('click', function() {
            _self.trigger.click();
        });

        _self.trigger.addEventListener('change', function() {
            if (!this.files.length) return;
            var files = Array.prototype.slice.call(this.files);
            files.forEach(function(file, i) {
                if (!/\/(?:jpeg|png|gif)/i.test(file.type)) return;
                var reader = new FileReader();
                _self.params.imgObj.size = file.size / 1024 > 1024 ? (~~(10 * file.size / 1024 / 1024)) / 10 + "MB" : ~~(file.size / 1024) + "KB";
                var li = document.createElement("li");
                li.innerHTML = '<div class="LUploader-progress"><span></span></div>';
                if (_self.params.showsize) {
                    var div_size = document.createElement('div');
                    div_size.className = 'LUploader-size';
                    div_size.textContent = _self.params.imgObj.size;
                    li.appendChild(div_size);
                }
                var LUploaderList = _self.trigger.parentElement.querySelector('.LUploader-list');
                if (!_self.params.multiple) { //假如是单个上传
                    if (_self.old_li) {
                        LUploaderList.removeChild(_self.old_li);
                    } else {
                        _self.old_li = li;
                    }
                }
                LUploaderList.appendChild(li);
                // LUploaderList.parentElement.nextElementSibling.style['display'] = 'none';

                reader.onload = function() {
                    var params = dataSet(_self.trigger);
                    var url = _self.params.url;
                    var result = this.result;
                    var img = new Image();
                    _self.params.imgObj.src = img.src = result;
                    li.style['background-image'] = 'url(' + result + ')';
                    if (result.length <= _self.params.maxsize) {
                        img = null;

                        var btn = document.querySelector('#' + _self.trigger.getAttribute('data-LUploader'));
                        btn.addEventListener('click', function() {
                            _self.upload(url, params, result, file.type, li);
                        });
                        // _self.upload(url, params, result, file.type, li);
                        return;
                    }
                    if (img.complete) {
                        callback();
                    } else {
                        img.onload = callback;
                    }

                    function callback() {
                        var data = _self.compress(img);
                        // _self.upload(url, params, data, file.type, li);
                        var btn = document.querySelector('#' + _self.trigger.getAttribute('data-LUploader'));
                        btn.addEventListener('click', function() {
                            _self.upload(url, params, data, file.type, li);
                        });
                        img = null;
                    }
                };
                reader.readAsDataURL(file);
            });
        });
    };
    LUploader.prototype.compress = function(img) {
        var canvas = document.createElement("canvas");
        var ctx = canvas.getContext('2d');
        var moreCanvas = document.createElement("canvas");
        var morectx = moreCanvas.getContext("2d");
        var maxsize = 100 * 1024;
        var width = img.width;
        var height = img.height;
        var ratio;
        if ((ratio = width * height / 4000000) > 1) {
            ratio = Math.sqrt(ratio);
            width /= ratio;
            height /= ratio;
        } else {
            ratio = 1;
        }
        canvas.width = width;
        canvas.height = height;
        ctx.fillStyle = "#fff";
        ctx.fillRect(0, 0, canvas.width, canvas.height);
        var count;
        if ((count = width * height / 1000000) > 1) {
            count = ~~(Math.sqrt(count) + 1);
            var nw = ~~(width / count);
            var nh = ~~(height / count);
            moreCanvas.width = nw;
            moreCanvas.height = nh;
            for (var i = 0; i < count; i++) {
                for (var j = 0; j < count; j++) {
                    morectx.drawImage(img, i * nw * ratio, j * nh * ratio, nw * ratio, nh * ratio, 0, 0, nw, nh);
                    ctx.drawImage(moreCanvas, i * nw, j * nh, nw, nh);
                }
            }
        } else {
            ctx.drawImage(img, 0, 0, width, height);
        }
        var ndata = canvas.toDataURL('image/jpeg', this.params.quality);
        moreCanvas.width = moreCanvas.height = canvas.width = canvas.height = 0;
        return ndata;
    };
    LUploader.prototype.upload = function(url, obj, basestr, type, li) {
        var isOK = false;
        var text = window.atob(basestr.split(",")[1]);
        var buffer = new Uint8Array(text.length);
        var pecent = 0;
        for (var i = 0; i < text.length; i++) {
            buffer[i] = text.charCodeAt(i);
        }
        var span = li.querySelector('.LUploader-progress').querySelector('span');
        var xhr = new XMLHttpRequest();
        xhr.open('post', url);
        xhr.onload = function(e) {
            if ((xhr.status >= 200 && xhr.status < 300) || xhr.status === 0) {
                var data = JSON.parse(xhr.responseText);
                var result = data['status'];
                var text = result == 0 ? '上传成功' : '上传失败';
                if( result == 0 ){
                    isOK = true;
                }
                span.style['width'] = '100%';
                span.innerHTML = text;
            }
            else {
                span.innerHTML = '上传失败';
            }
        }
        xhr.upload.addEventListener('progress', function(e) {
            pecent = ~~(100 * e.loaded / e.total);
            span.style['width'] = pecent + '%';
            span.innerHTML = (pecent == 100 ? 99 : pecent) + '%';
        }, false);
        var data = {};
        for (var key in obj) {
            if (key !== 'luploader') {
                if (obj[key] == 'basestr') {
                    data[key] = basestr;
                } else {
                    data[key] = obj[key];
                }
            }
        };
        data = serializeObject(data);
        xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded; charset=UTF-8');
        xhr.setRequestHeader('X-Requested-With', 'XMLHttpRequest');
        xhr.send(data);

        return isOK;
    }

    function isArray(arr) {
        if (Object.prototype.toString.apply(arr) === '[object Array]') return true;
        else return false;
    };

    function serializeObject(obj) {
        if (typeof obj === 'string') return obj;
        var resultArray = [];
        var separator = '&';
        for (var prop in obj) {
            if (obj.hasOwnProperty(prop)) {
                if (isArray(obj[prop])) {
                    var toPush = [];
                    for (var i = 0; i < obj[prop].length; i++) {
                        toPush.push(encodeURIComponent(prop) + '=' + encodeURIComponent(obj[prop][i]));
                    }
                    if (toPush.length > 0) resultArray.push(toPush.join(separator));
                } else {
                    resultArray.push(encodeURIComponent(prop) + '=' + encodeURIComponent(obj[prop]));
                }
            }

        }
        return resultArray.join(separator);
    };

    function dataSet(el) {
        var dataset = {};
        for (var i = 0; i < el.attributes.length; i++) {
            var attr = el.attributes[i];
            if (attr.name.indexOf('data-') >= 0) {
                dataset[toCamelCase(attr.name.split('data-')[1])] = attr.value;
            }
        }
        return dataset;
    }

    function toCamelCase(string) {
        return string.toLowerCase().replace(/-(.)/g, function(match, group1) {
            return group1.toUpperCase();
        });
    };
})();
