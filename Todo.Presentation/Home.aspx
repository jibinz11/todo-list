<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Todo.Presentation.Home" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>To-Do</title>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="/Content/site/main.min.css">
</head>

<body>

    <div class="app-wrapper">

        <nav class="app-side-nav">
            <h3 class="app-main-title text-light">Things-To-Do</h3>
            <div class="app-profile__container d-flex flex-column align-items-center">
                <img src="/Content/Site/images/profile-placeholder.jpg" alt="profile-pic" class="rounded-circle mt-5">
                <h6 class="text-light mt-3 mb-0" runat="server" id="lblUserName">John Doe</h6>
                <p class="text-muted-light"><small>Ireland, Europe</small></p>
            </div>
            <div class="row">
                <div class="col-12">
                    <div class="input-group input-group-sm mt-4 mb-3 app-search__container app-search--light">
                        <input id="txtSearch" type="text" class="form-control" placeholder="Search task...">
                        <div class="input-group-append">
                            <span class="input-group-text">
                                <img id="btnSearch" src="/Content/Site/images/search.svg" alt="search-icon">
                            </span>
                        </div>
                    </div>
                </div>
            </div>
            <ul class="list-group list-group-flush app-side-nav__menu mt-4">
                <li class="list-group-item">
                    <a href="#">
                        <span class="app-side-nav__icon">
                            <img src="/Content/Site/images/add.svg" alt="new-task-icon">
                        </span>
                        <span class="nav__title add-new-task">Add new task</span>
                    </a>
                </li>
                <li class="list-group-item">
                    <a href="#" class="js-theme-switch">
                        <span class="app-side-nav__icon">
                            <img src="/Content/Site/images/dark-mode.svg" alt="dark-mode-icon">
                        </span>
                        <span class="nav__title">Dark Mode</span>
                    </a>
                </li>
                <li class="list-group-item">
                    <a href="/sign-out">
                        <span class="app-side-nav__icon">
                            <img src="/Content/Site/images/signout.svg" alt="dark-mode-icon">
                        </span>
                        <span class="nav__title">Signout</span>
                    </a>
                </li>
            </ul>
        </nav>

        <section class="app-main-content">
            <%--<small class="text-muted">Project : </small>--%>
            <%--<span class="badge badge-pill badge-light text-muted">Xync Tool UI</span>--%>
            <h3 class="app-main-title">Manage your tasks from here
                <button id="btnNew" type="button" class="app-task__add">
                    <img src="/Content/site/images/add.svg" alt="add-task">
                </button>
            </h3>

            <div id="taskFullListContainer" class="app-task__wrap">
            </div>

            <div id="addNewTodoContainer" style="display: none" class="app-task__add-form mt-4">

<form id="frmNewTask">
                    <div class="row">
                    <div class="col-12">
                        <h5 class="app-task__title mb-3">Add new task</h5>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <input id="frmTitle" autocomplete="off" type="text" class="form-control form-control-sm" placeholder="Enter task title..">
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <input type="date" autocomplete="off" id="frmDueDate" class="form-control form-control-sm" placeholder="Choose a date">
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="form-group">
                            <textarea  class="form-control form-control-sm" id="frmDescription" rows="3" placeholder="Enter task description.."></textarea>
                        </div>
                    </div>
                    <div class="col-12">
                        <div class="btn-toolbar d-flex justify-content-between" role="group" aria-label="Basic example">
                            <button type="button" id="form-cancel" class="btn btn-light">Cancel</button>
                            <button type="button" id="form-submit" class="btn btn-primary float-right">Add</button>
                        </div>
                    </div>
                </div>
</form>
            </div>

        </section>

    </div>
    <template id="taskSectionTmpl">
                          <div class="app-task__container mt-5">
                    <h5 class="app-task__title "><span class="category-title"></span>
                        <small class="text-muted float-right">
                            <span class="badge badge-pill badge-primary task-count"></span>
                        </small>
                    </h5>
                    <ul class="task-list list-group list-group-flush app-task__list">
                        
                      
                       
                    </ul>
                </div>
      </template>
    <template id="taskTmpl">
                                <li class="task-item list-group-item app-task__item">
                            <input class="btn-toggle-complete" type="checkbox">
                            <p class="app-task__item-title"><span class="task-title"></span><span class="task-due-date app-task__item-date">28 May 2018</span></p>
                            <p class="app-task__item-desc task-desc">Lorem ipsum, dolor sit amet consecteturadipisicing elit.</p>
                            <button type="button" class="close js-task-remove btn-delete" aria-label="Close">
                                <span aria-hidden="true"></span>
                            </button>
                        </li>
    </template>
    <script src="Content/js/jquery-min.js"></script>
    <script src="Content/site/jquery.cookie.js"></script>
    <script type="text/javascript">
        var app = {
            tasks:
            {
                get: function () {
                    $.ajax({
                        url: '/api/task/getgrouped?userid=' + $.cookie('at'),
                        method: 'GET',
                        success: function (data) {
                            app.tasks.render(data);
                        },
                        headers: {
                            'Authorization': $.cookie('at')
                        }
                    });
                },
                render: function (data) {
                    $('#taskFullListContainer').empty();
                    if (data && data.length > 0) {
                        for (let i = 0; i < data.length; i++) {
                            let grp = data[i];
                            let container = $($('#taskSectionTmpl').html());
                            container.find('.category-title').html(grp[0].RelativeDueOn);
                            var completedCount = grp.filter(function (a) { return a.Completed }).length;
                            container.find('.task-count').html(completedCount + ' of ' + grp.length);
                            for (let j = 0; j < grp.length; j++) {
                                let task = grp[j];
                                let item = $($('#taskTmpl').html());
                                item.find('.task-title').html(task.Title);
                                item.find('.task-desc').html(task.Description);
                                item.find('.task-due-date').html(task.DueOnString);
                                item.find('.btn-toggle-complete').attr('data-id', task.Id);
                                item.find('.btn-delete').attr('data-id', task.Id);

                                if (task.Completed) {
                                    item.find('.btn-toggle-complete').attr('checked', 'checked');
                                }
                                else {
                                    item.find('.btn-toggle-complete').removeAttr('checked');
                                }
                                container.find('.task-list').prepend(item);
                            }

                            $('#taskFullListContainer').prepend(container);
                        }
                    }
                    else {
                        $('#taskFullListContainer').html('<h2 style="text-align:center;padding:300px">No To do found</h2>');
                    }
                },
                delete: function (id) {
                    $.ajax({
                        url: '/api/task/delete?id=' + id,
                        method: 'POST',
                        success: function (data) {
                            app.tasks.get();
                        },
                        headers: {
                            'Authorization': $.cookie('at')
                        }
                    });
                },
                complete: function (id) {
                    $.ajax({
                        url: '/api/task/togglecomplete?id=' + id,
                        method: 'POST',
                        success: function (data) {
                            app.tasks.get();
                        },
                        headers: {
                            'Authorization': $.cookie('at')
                        }
                    });
                },
                add: function (task) {
                    $.ajax({
                        url: '/api/task/Add',
                        method: 'POST',
                        contentType: 'application/json;charset=utf-8',
                        dataType: 'JSON',
                        data: JSON.stringify(task),
                        success: function (data,callback) {
                            app.tasks.get();
                            $('#addNewTodoContainer').hide();
                            $('#taskFullListContainer').show();
                            if (typeof callback == 'function')
                                callback();
                        },
                        headers: {
                            'Authorization': $.cookie('at')
                        }
                    });

                }
            }
        }

        $(function () {
            app.tasks.get();

            $(document).on('click', '.btn-delete', function (e) {
                var id = $(this).attr('data-id');
                app.tasks.delete(id);
            });
            $(document).on('click', '.btn-toggle-complete', function (e) {
                var id = $(this).attr('data-id');
                app.tasks.complete(id);
            });
            $('#btnNew , .add-new-task').on('click', function (e) {
                $('#addNewTodoContainer').toggle();
                $('#taskFullListContainer').toggle();
                $('#frmNewTask')[0].reset();
            });
            $('#form-cancel').on('click', function (e) {
                $('#addNewTodoContainer').hide();
                $('#taskFullListContainer').show();
                $('#frmNewTask')[0].reset();
            });
            $('#form-submit').on('click', function (e) {
                var title = $('#frmTitle').val();
                var date = $('#frmDueDate').val();
                var desc = $('#frmDescription').val();
                if (!title || !desc || !date) {
                    return;
                }
                let task = {
                    Title: title,
                    Description: desc,
                    DueOn: date,
                    User: {
                        Id: $.cookie('at')
                    }
                };
                app.tasks.add(task, function () { $('#frmNewTask')[0].reset();});

            });
            $('#btnSearch').click(function () {
                let query = $('#txtSearch').val();
                let pattern = new RegExp(query, 'gi');
                var tasks = $('.task-item');
                $(tasks).each(function (i, t) {
                    let tElem = $(t);
                    let title = tElem.find('.task-title').html();
                    let desc = tElem.find('.task-desc').html();
                    if (!title.match(pattern) && !desc.match(pattern)) {
                        tElem.hide();
                    }
                    else {
                        tElem.show();
                    }
                });


            });

            $('#txtSearch').keydown(function (e) {
                if (e.which == 13 || e.keyCode == 13) {
                    $('#btnSearch').trigger('click');
                }
            });
        });
    </script>
    <%--UI related scripts--%>
    <script>

        function getCookie(cname) {
            var name = cname + "=";
            var decodedCookie = decodeURIComponent(document.cookie);
            var ca = decodedCookie.split(';');
            for (var i = 0; i < ca.length; i++) {
                var c = ca[i];
                while (c.charAt(0) == ' ') {
                    c = c.substring(1);
                }
                if (c.indexOf(name) == 0) {
                    return c.substring(name.length, c.length);
                }
            }
            return "";
        }

        let appTheme = getCookie('theme');
        let lightThemeName = 'Light Mode';


        if (appTheme === 'dark') {
            $('body').addClass('dark-knight');
            $('.js-theme-switch').find('.nav__title').text(lightThemeName);
        };


        $('.js-theme-switch').click(function (e) {
            e.preventDefault();

            let switctToTheme = $(this).find('.nav__title').text();

            if (switctToTheme === lightThemeName) {
                $('body').removeClass('dark-knight');
                $(this).find('.nav__title').text('Dark Mode');
                document.cookie = "theme= ";
            } else {
                $('body').addClass('dark-knight');
                $(this).find('.nav__title').text(lightThemeName);
                document.cookie = "theme=dark";
            }



        });
    </script>
</body>

</html>
