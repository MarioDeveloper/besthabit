<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv='Content-Type' content='text/html; charset=UTF-8'/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Dashboard">
    <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

    <title>Tworzenie wyzwania</title>

    <%--DATE TIME PICKER RESOURCES--%>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <%-- Datetimepicker language--%>
    <spring:url value="/resources/Theme/assets/js/moment.js" var="momento"/>
    <script src="${momento}"></script>
    <spring:url value="/resources/Theme/assets/js/pl.js" var="pl_js"/>
    <script src="${pl_js}"></script>

    <%--<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.15.1/moment.min.js"></script>--%>
    <link rel="stylesheet" type="text/css"
          href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.43/css/bootstrap-datetimepicker.min.css">
    <link rel="stylesheet" type="text/css"
          href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.43/css/bootstrap-datetimepicker-standalone.css">
    <script type="text/javascript"
            src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.43/js/bootstrap-datetimepicker.min.js"></script>


    <style>
        .buttonCreateEvent {
            position: relative;
            left: 35%;
        }

    </style>

    <!-- Bootstrap core CSS -->
    <spring:url value="/resources/Theme/assets/css/bootstrap.css" var="bootstrap_core"/>
    <link href="${bootstrap_core}" rel="stylesheet"/>

    <!--external css-->
    <spring:url value="/resources/Theme/assets/font-awesome/css/font-awesome.css" var="font_awesome"/>
    <link href="${font_awesome}" rel="stylesheet"/>

    <!-- Custom styles for this template -->
    <spring:url value="/resources/Theme/assets/css/style.css" var="style_css"/>
    <link href="${style_css}" rel="stylesheet"/>

    <spring:url value="/resources/Theme/assets/css/style-responsive.css" var="style_responsive"/>
    <link href="${style_responsive}" rel="stylesheet"/>

    <spring:url value="/resources/Theme/assets/css/to-do.css" var="to_do"/>
    <link href="${to_do}" rel="stylesheet"/>
</head>

<body>

<section id="container">
    <!-- **********************************************************************************************************************************************************
    TOP BAR CONTENT & NOTIFICATIONS
    *********************************************************************************************************************************************************** -->
    <!--header start-->
    <header class="header black-bg">
        <div class="sidebar-toggle-box">
            <div class="fa fa-bars tooltips" data-placement="right" data-original-title="Toggle Navigation"></div>
        </div>
        <!--logo start-->
        <c:url value="/" var="dashboard"/>
        <a href="${dashboard}" class="logo"><b>BUDUJ SWOJE NAWYKI</b></a>

    </header>
    <!--header end-->

    <!-- **********************************************************************************************************************************************************
    MAIN SIDEBAR MENU
    *********************************************************************************************************************************************************** -->
    <!--sidebar start-->
    <aside>
        <div id="sidebar" class="nav-collapse">
            <!-- sidebar menu start-->
            <ul class="sidebar-menu" id="nav-accordion">

                <li class="mt">
                    <c:url value="/" var="dashboard"/>
                    <a href="${dashboard}"><i
                            class="fa fa-dashboard"></i><span>&nbsp;Dashboard</span></a>
                </li>

                <li class="sub-menu">
                    <a href="javascript:;">
                        <i class="fa fa-th"></i>
                        <span>Zaplanuj wydarzenie</span>
                    </a>
                    <ul class="sub">
                        <c:url value="/oneTimeEvent" var="oneTimeEvent"/>
                        <li><a href="${oneTimeEvent}"><b>Jednorazowe</b></a></li>
                        <c:url value="/reccuringEvent" var="reccuringEvent"/>
                        <li><a href="${reccuringEvent}"><b>Cykliczne</b></a></li>
                    </ul>
                </li>
                <li class="sub-menu">
                    <c:url value="/ranking" var="ranking"/>
                    <a href="${ranking}"><i class="fa fa-bar-chart-o"></i><span>&nbsp;Ranking</span></a>
                </li>
                <li class="sub-menu">
                    <c:url value="/history" var="history"/>
                    <a href="${history}"><i class="fa fa-book"></i><span>&nbsp;Historia</span></a>
                </li>
                <li class="sub-menu" class="active">
                    <c:url value="/challengeEvent" var="challenge"/>
                    <a href="${challenge}"><i class="glyphicon glyphicon-fire"
                                              aria-hidden="true"></i><span>&nbsp;Rzuć wyzwanie</span></a>
                </li>
                <%--<hr width="220" align="left">--%>
                <li class="sub-menu">
                    <a href="javascript:;">
                        <i class="fa fa-cogs"></i>
                        <span>Ustawienia konta</span>
                    </a>
                    <ul class="sub">
                        <c:url var="showFormForUpdateUserPersonalData" value="showFormForUpdateUserPersonalData"/>
                        <li><a href="<c:out value="${showFormForUpdateUserPersonalData}"/>"><b>Edytuj dane
                            osobowe</b></a></li>

                        <c:if test="${loggedUser.image != null}">
                            <c:url var="showFormForUpdateUserImage" value="showFormForUpdateUserImage"/>
                            <li><a href="<c:out value="${showFormForUpdateUserImage}"/>"><b>Edytuj zdjęcie</b></a></li>
                        </c:if>
                    </ul>
                </li>
                <li class="sub-menu">
                    <c:url value="/logout" var="logout"/>
                    <a href="${logout}"><i class="fa fa-briefcase" aria-hidden="true"></i><span>&nbsp;Wyloguj się</span></a>
                </li>
            </ul>
            <!-- sidebar menu end-->
        </div>
    </aside>
    <!--sidebar end-->

    <!-- **********************************************************************************************************************************************************
    MAIN CONTENT
    *********************************************************************************************************************************************************** -->
    <!--main content start-->
    <section id="main-content">
        <section class="wrapper">

            <div class="row">
                <div class="col-lg-9 main-chart">

                    <!-- BASIC FORM ELELEMNTS -->
                    <div class="row mt">
                        <div class="col-lg-12">
                            <div class="form-panel">
                                <h4 class="mb">Tworzenie wyzwania</h4>

                                <form action="createChallengeEvent" class="form-horizontal style-form" method="POST" accept-charset="UTF-8">

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">Tytuł</label>
                                        <div class="col-sm-10">
                                            <spring:bind path="challenge.title">
                                                <input type="text" class="form-control" name="${status.expression}" value="${status.value}" required="required"><br />
                                            </spring:bind>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">Opis</label>
                                        <div class="col-sm-10">
                                            <spring:bind path="challenge.description">
                                                <input type="text" class="form-control" name="${status.expression}" value="${status.value}"><br />
                                            </spring:bind>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">Poziom trudności</label>
                                        <spring:bind path="challenge.difficultyLevel">
                                            <select name="${status.expression}" class="form-control" style="width: 100px;margin-left: 152px">
                                                <%--<c:forEach var="entry" items="${unitList}">--%>
                                                    <%--<option value="${entry.ID}"> ${entry.name}</option>--%>
                                                <%--</c:forEach>--%>
                                                    <option value="Łatwy"> Łatwy</option>
                                                    <option value="Średni"> Średni</option>
                                                    <option value="Trudny"> Trudny</option>
                                            </select>
                                        </spring:bind>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">Data wykonania</label>
                                        <div class='input-group date' id='datetimepicker1'
                                             style="width: 200px;margin-left: 152px">
                                            <spring:bind path="challenge.plannedDate">
                                                <input type="text" class="form-control" name="${status.expression}" value="${status.value}" required="required"><br />
                                            </spring:bind>
                                            <span class="input-group-addon">
                                            <span class="glyphicon glyphicon-calendar"></span>
                                        </span>
                                        </div>
                                    </div>


                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">Wybierz swoje przeciwnika</label>
                                        <spring:bind path="challenge.opponentId">
                                            <select name="${status.expression}" class="form-control" style="width: 200px;margin-left: 152px">
                                                    <c:forEach var="entry" items="${userList}">
                                                        <option value="${entry.id}" > ${entry.firstName} ${entry.lastName}</option>
                                                    </c:forEach>
                                            </select>
                                        </spring:bind>
                                    </div>

                                    <script type="text/javascript">
                                        $(function () {
                                            $('#datetimepicker1').datetimepicker({locale: 'pl'});
                                        });
                                    </script>

                                    <input id = 'button1' type="submit" value="Rzuć wyzwanie!"
                                           class="btn btn-primary btn-lg btn-block buttonCreateEvent"
                                           style="width: 300px;"/>

                                </form>
                            </div>
                        </div><!-- col-lg-12-->
                    </div><!-- /row -->

                </div>


                <!-- **********************************************************************************************************************************************************
                  RIGHT SIDEBAR CONTENT
                  *********************************************************************************************************************************************************** -->

                <div class="col-lg-3 ds">
                    <!--COMPLETED ACTIONS DONUTS CHART-->
                    <h3>POWIADOMIENIA</h3>

                    <c:forEach var="tempNotificationList" items="${notificationList}">

                        <div class="desc">
                            <div class="thumb">
                                <span class="badge bg-inverse"><i class="fa fa-clock-o"></i></span>
                            </div>
                            <div class="details">
                                <p>
                                    <muted>${tempNotificationList.time} temu</muted>
                                    <br/>
                                    <a href="#">${tempNotificationList.firstName} ${tempNotificationList.lastName}</a>
                                    wypełnił(a) zadanie i zdobył(a) ${tempNotificationList.experiencePoint} pkt doświadczenia.<br/>
                                </p>
                            </div>
                        </div>
                    </c:forEach>

                </div><!-- /col-lg-3 -->


            </div>
        </section>
    </section>

    <!--main content end-->
    <!--footer start-->
    <!--main content end-->
    <!--footer start-->
    <footer class="site-footer">
        <div class="text-center">
            2018 - MarioDeveloper
        </div>
    </footer>


    <!--footer end-->
</section>

<!--script for this page-->
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>

<spring:url value="/resources/Theme/assets/js/tasks.js" var="task_js"/>
<script src="${task_js}" type="text/javascript"/>

<!-- js placed at the end of the document so the pages load faster -->
<spring:url value="/resources/Theme/assets/js/jquery.js" var="jquery"/>
<script src="${jquery}"></script>

<spring:url value="/resources/Theme/assets/js/bootstrap.min.js" var="bootstrap_min_js"/>
<script src="${bootstrap_min_js}"></script>

<spring:url value="/resources/Theme/assets/js/jquery.dcjqaccordion.2.7.js" var="dcjq"/>
<script src="${dcjq}" type="text/javascript" class="include"></script>

<spring:url value="/resources/Theme/assets/js/jquery.scrollTo.min.js" var="scrollTo_min_js"/>
<script src="${scrollTo_min_js}"></script>

<spring:url value="/resources/Theme/assets/js/jquery.sparkline.js" var="sparkline"/>
<script src="${sparkline}"></script>

<!--common script for all pages-->
<spring:url value="/resources/Theme/assets/js/common-scripts.js" var="common_scripts"/>
<script src="${common_scripts}"></script>

<script type="application/javascript">

    $('#button1').on('click', function() {
        var self = this;

        setTimeout(function() {
            $(self).attr('disabled', true);
        });
    });
</script>


</body>
</html>
