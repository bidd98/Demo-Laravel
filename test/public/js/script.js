$(document).ready(function () {
    $('#confirm-delete').on('show.bs.modal', function (e) {
        $(this).find('form').attr('action', $(e.relatedTarget).data('href'));
    });

    // Get form edit
    var editWatchForm = $('#watch-edit-form');

    editWatchForm.on('click', '.btn-dlt-image', function (e) {
        var hiddenInput = '';

        var btn = e.target;

        var id = e.target.id.substring(6);

        var imageContainer = $(btn).closest('.img-container');

        toggleSaveButton();

        if (id > 0) {
            hiddenInput = '<input class="" type="hidden" name="images-del[]" value="' + id + '"/>';
        } else {
            hiddenInput = '<input class="images-del-cf" type="hidden" name="images-del[]" value="' + btn.name + '"/>';
        }

        imageContainer.remove();

        $('.images-del-df').remove();

        editWatchForm.append(hiddenInput);
    })

    $(document).click(function (e) {
        console.log(e.target);
        var searchResult = document.getElementById('search-result');
        var searchBox = document.getElementById('search-box');
        if (e.target != searchResult && e.target != searchBox) {
            $('#search-result').css('visibility', 'hidden');
        }
    });

    $('#search-box').click(function (e) {
        console.log('true');
        $('#search-result').css('visibility', 'visible');
    });

    $('#search-box').keyup(function () {
        var search = $(this).val();
        $('#search-result').css('visibility', 'visible');

        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
        });

        $.ajax({
            method: "POST",
            url: "search",
            data: { search: search }
        })
            .done(function (response) {

                var data = JSON.parse(response);

                showSearchResult(data);
            });
    });

    function toggleSaveButton() {
        var length = $('.img-container').length;

        if (length == 1) {
            $('input:submit').attr('disabled', 'true');
        } else {
            $('input:submit').removeAttr('disabled');
        }
    }

    $("input:file").change(function () {
        toggleSaveButton();

        $('.images-add-df').remove();

        deleteAddedImage();

        hideAddImage();

        readURL(this);
    })

    function readURL(input) {

        if (input.files) {

            console.log(input.files);

            var imageContainer = $(".image-div");

            var fileArray = input.files;
            ;

            for (var i = 0; i < fileArray.length; i++) {

                var imageDiv = '';

                var reader = new FileReader()


                var tempFile = fileArray[i];

                reader.readAsDataURL(tempFile);

                var tempFileName = tempFile.name;

                console.log(tempFileName);

                // console.log(reader);

                reader.name = tempFileName;

                reader.onload = function (e) {

                    var lang = $('html').attr('lang');
                    if (lang === 'en') {
                        var btn = 'Delete';
                    } else if (lang === 'vn') {
                        var btn = 'Xóa';
                    }

                    var imageDiv = '<div class="img-container col-4 added">'
                        + '<img src="' + e.target.result + '" alt="Avatar" class="image  img-fluid img-thumbnail">'
                        + '<div class="overlay">'
                        + '<div class="text"><button name="' + e.target.name + '" type="button" id="image--1" class="btn btn-danger btn-dlt-image">' + btn + '</button></div>'
                        + '</div>'
                        + '</div>';

                    imageContainer.append(imageDiv);
                }
            }
        }
    }


    function hideAddImage() {
        var div = $('.added');

        div.hide();

        console.log(div);
    }

    function deleteAddedImage() {
        $('.images-del-cf').remove();
    }


    function showSearchResult(data) {
        var search = $('#search-box').val();

        // console.log('search: ' + search);
        var boldSearch = '<b>' + search + '</b>';

        // console.log('bold search: ' + boldSearch);
        var html = '<p class="search-items">';

        if (data.length != 0) {
            for (var i = 0; i <= data.length; i++) {
                var item = data[i];
                var re = new RegExp(search, 'g');
                var content = item.name + ' in ' + item.category + '(Price: ' + item.price + '$ with discount ' + item.discount;
                content = content.replace(re, boldSearch)
                itemString = '<span><a href="/watches/' + item.id + '">' + content + '%)</a></span></br>';

                html += itemString;
                if (i == data.length - 1) {
                    break;
                }
            };
        } else {
            html += '<span>No results found</span>';
        }
        html += "</p>";
        $('#search-result').html(html);
    }
});