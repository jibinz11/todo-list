<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="Todo.Presentation.Index" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <title>Todo - Manage your activities</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" type="text/css" href="/content/css/bootstrap.min.css">
    <!-- Font -->
    <link rel="stylesheet" type="text/css" href="/content/css/font-awesome.min.css">
    <!-- Slicknav -->
    <link rel="stylesheet" type="text/css" href="/content/css/slicknav.css">
    <!-- Owl carousel -->
    <link rel="stylesheet" type="text/css" href="/content/css/owl.carousel.css">
    <link rel="stylesheet" type="text/css" href="/content/css/owl.theme.css">
    <!-- Animate -->
    <link rel="stylesheet" type="text/css" href="/content/css/animate.css">
    <!-- Main Style -->
    <link rel="stylesheet" type="text/css" href="/content/css/main.css">
    <!-- Extras Style -->
    <link rel="stylesheet" type="text/css" href="/content/css/extras.css">
    <!-- Responsive Style -->
    <link rel="stylesheet" type="text/css" href="/content/css/responsive.css">
</head>
<body>

    <!-- Header Area wrapper Starts -->
    <header id="header-wrap">
        <!-- Navbar Start -->
        <nav class="navbar navbar-expand-lg fixed-top scrolling-navbar indigo">
            <div class="container">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#main-navbar" aria-controls="main-navbar" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                        <span class="icon-menu"></span>
                        <span class="icon-menu"></span>
                        <span class="icon-menu"></span>
                    </button>
                    <a href="index.html" class="navbar-brand">
                       <h3 style="color:#139e99">Checklist Manager</h3></a>
                </div>
            </div>



        </nav>
        <!-- Navbar End -->



    </header>
    <!-- Header Area wrapper End -->

            <!-- Contact Form Section Start -->
    <section id="addNewTodoContainer" style="display:none" class=" contact-form section-padding">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h2 class="section-title wow fadeInDown animated" data-wow-delay="0.3s"></h2>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12 col-md-12 col-xs-12">
                    <h3 class="title-head text-left">Create new to do</h3>
                    <form class="contact-form" data-toggle="validator">
                        <div class="row">
                            <div class="col-lg-8 col-md-12 col-xs-12">
                                <div class="form-group">
                                    <i class="contact-icon fa fa-user"></i>
                                    <input type="text" autocomplete="off" class="form-control" id="frmTitle" placeholder="Title of to-do" required data-error="Please provide a title for to-do">
                                    <div class="help-block with-errors"></div>
                                </div>
                            </div>
                           
                            <div class="col-lg-4 col-md-12 col-xs-12">
                                <div class="form-group">
                                    <i class="contact-icon fa fa-pencil-square-o"></i>
                                    <input type="text" autocomplete="off" class="form-control" id="frmDueDate" placeholder="Due Date" required data-error="Set a due date">
                                    <div class="help-block with-errors"></div>
                                </div>
                            </div>
                            <div class="col-lg-12 col-md-12 col-xs-12">
                                <textarea class="form-control" id="frmDescription" rows="4" placeholder="Description" required data-error="Please provide a description"></textarea>
                                <div class="help-block with-errors"></div>
                                <button type="button" id="form-submit" class="btn btn-primary btn-form-submit">Add <i class="fa fa-plus"></i></button>
                                 <button type="button" id="form-cancel" class="btn btn-common btn-form-submit">Cancel <i class="fa fa-close"></i></button>
                                <div id="msgSubmit" class="h3 text-center hidden"></div>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                    </form>
                </div>

            
            </div>
        </div>
    </section>
    <!-- Contact Form Section End -->



    <%--task template--%>
    <div id="taskFullListContainer"></div>

    <template id="taskSectionTmpl">
        <section class="section-padding">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h2 style="text-align:left" class="category-title section-title wow fadeInDown animated" data-wow-delay="0.3s">Today</h2>
                </div>
            </div>
            <div class="task-list row">
                <!-- Start Service Icon 1 -->
                
                <!-- End Service Icon 1 -->


            </div>
        </div>
    </section>
    </template>
    <template id="taskTmpl">
        <div class="col-md-6 col-lg-4 col-xs-12">
                    <div class="service-box">
                        <div class="task-status service-icon">
                            <i style="color:green" class="fa fa-check completed"></i>
                            <i style="color:red" class="fa fa-times pending"></i>
                        </div>
                        <div class="service-content">
                            <h4><a class="task-title" href="#"></a></h4>
                            <p class="task-desc">
                                
               
                            </p>
                            <span>
                                <i class ="fa fa-calendar-plus-o"></i><em class="task-due-date">Jan 10, 2019</em>
                            </span>
                        </div>
                    </div>
          <div class="row">
                <div class="col-md-12">
                    <div class=" btn-toolbar">
                    <button  type="button" class="btn-toggle-complete btn btn-sm btn-success"><i class="fa fa-check-square-o"></i></button>
                    <button class="btn-delete btn btn-sm btn-danger" type="button"><i class="fa fa-trash-o"></i></button>
                                       </div>

                </div>
          </div>
                </div>
        
    </template>
    <%--task template ends here--%>



    <!-- Footer Section -->
    <footer class="footer">


        <!-- Copyright -->
        <div id="copyright">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 col-md-6 col-xs-12">
                        <p class="copyright-text">
                            All copyrights reserved © 2019 - Designed &amp; Developed by Jinson John
                        </p>
                    </div>
                    <div class="col-lg-6 col-md-6 col-xs-12">
                        <ul class="nav nav-inline  justify-content-end ">
                            <li class="nav-item">
                                <a class="nav-link active" href="#">Home</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Sitemap</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Privacy Policy</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Terms of services</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <!-- Copyright  End-->

    </footer>
    <!-- Footer Section End-->

    <!-- Go to Top Link -->

        <a href="javascript:void" id="btnNew" class="back-to-top">
        <i class="fa fa-plus-square-o"></i>
    </a>

    <!-- Preloader -->
    <div id="preloader">
        <div class="loader" id="loader-1"></div>
    </div>
    <!-- End Preloader -->

    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="/content/js/jquery-min.js"></script>
    <script src="/content/js/popper.min.js"></script>
    <script src="/content/js/bootstrap.min.js"></script>
    <script src="/content/js/owl.carousel.min.js"></script>
    <script src="/content/js/jquery.mixitup.js"></script>
    <script src="/content/js/jquery.countTo.js"></script>
    <script src="/content/js/jquery.nav.js"></script>
    <script src="/content/js/scrolling-nav.js"></script>
    <script src="/content/js/jquery.easing.min.js"></script>
    <script src="/content/js/jquery.slicknav.js"></script>
    <script src="/content/js/form-validator.min.js"></script>
    <script src="/content/js/contact-form-script.js"></script>
    <script src="/content/js/main.js"></script>
    <script type="text/javascript">
        var app = {
            tasks:
            {
                get: function () {
                    $.ajax({
                        url: '/api/task/getgrouped',
                        method: 'GET',
                        success: function (data) {
                            app.tasks.render(data);
                        }
                    });
                },
                render: function (data) {
                    $('#taskFullListContainer').empty();
                    if (data && data.length > 0) {
                        for (let i = 0; i < data.length; i++) {
                            let grp = data[i];
                            let container = $($('#taskSectionTmpl').html());
                            container.find('.category-title').html(grp[0].RelativeDueOn + '(' + grp.length + ')');
                            for (let j = 0; j < grp.length; j++) {
                                let task = grp[j];
                                let item = $($('#taskTmpl').html());
                                item.find('.task-title').html(task.Title);
                                item.find('.task-desc').html(task.Description);
                                item.find('.task-due-date').html(task.DueOnString);
                                item.find('.btn-toggle-complete').attr('data-id', task.Id);
                                item.find('.btn-delete').attr('data-id', task.Id);
                                if (task.Completed) {
                                    item.find('.task-status .completed').show();
                                    item.find('.task-status .pending').hide();
                                }
                                else {
                                    item.find('.task-status .completed').hide();
                                    item.find('.task-status .pending').show();
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
                        }
                    });
                },
                complete: function (id) {
                    $.ajax({
                        url: '/api/task/togglecomplete?id=' + id,
                        method: 'POST',
                        success: function (data) {
                            app.tasks.get();
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
                        success: function (data) {
                            app.tasks.get();
                            $('#addNewTodoContainer').hide();
                            $('#taskFullListContainer').show();
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
            $('#btnNew').on('click',function (e) {
                $('#addNewTodoContainer').show();
                $('#taskFullListContainer').hide();
            });
            $('#form-cancel').on('click', function (e) {
                $('#addNewTodoContainer').hide();
                $('#taskFullListContainer').show();
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
                    DueOn:date
                };
                app.tasks.add(task);
                
            });
        });
    </script>
</body>
</html>

