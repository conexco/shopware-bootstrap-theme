;(function($, window, document, undefined) {

    // Wait 'till the document is ready
    $(function () {

        function addUpload($upload, file) {
            var $form = $('.answerUpload'),
                $container = $('<div>', { 'class': 'alert-wrapper' }).appendTo($form);

            if (file.error) {
                var $response = $('<div>', {
                    'class': 'alert alert-danger',
                    'html': file.error
                }).appendTo($container);
            } else {
                var $response = $('<div>', {
                    'class': 'alert alert-success',
                    'html': file.message
                }).appendTo($container);
            }

            window.setTimeout(function () {
                $response.slideUp('slow', function () {
                    $container.remove();
                });
            }, 3000);
        }

        var $fileUploads = $('.option_values_upload_file_custom');
        $fileUploads.each(function () {
            var $this = $(this),
                $dropZone = $this.find('.fileupload-dropzone'),
                $field = $this.find('.fileupload-input'),
                $answerId = $this.find('input[name=answer]').val(),
                $ticketId = $this.find('input[name=ticket]').val(),
                $form = $this.parent();
                $progress = $('<div class="progress progress-striped active">').append('<div class="bar">').append('<div class="message">').hide().appendTo($form);

            if (!$.support.xhrFileUpload) {
                $dropZone.hide();
            }
            var uploadUrl = $this.parent().attr('action');
            $field.fileupload({
                dataType: 'json',
                dropZone: $dropZone,
                url: uploadUrl + '?ticketId=' + $ticketId + '&answerId=' + $answerId,
                paramName: 'files',
                redirect: 0,
                //forceIframeTransport: true,
                formData: function (form) {
                    return [];
                },
                start: function (e, data) {
                    if ($.support.xhrFileUpload) {
                        $progress.children('.bar').css('width', 0);
                    } else {
                        $progress.children('.bar').css('width', '100%');
                    }
                    $progress.show();
                },
                progressall: function (e, data) {
                    var progress = parseInt(data.loaded / data.total * 100, 10);
                    $progress.children('.bar').css('width', '' + progress + '%');
                },
                done: function (e, data) {
                    $progress.hide();

                    $.each(data.result, function (index, file) {
                        addUpload($this, file);
                    });
                }
            });
        });
    });

})(jQuery, window, document);