<!DOCTYPE html>

<#assign applicationReportIndexModel = reportModel.applicationReportIndexModel>

<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>${reportModel.projectModel.name} - Server Resource Report</title>
    <link href="resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="resources/css/windup.css" rel="stylesheet" media="screen">
    <link href="resources/img/rhamt-icon-128.png" rel="shortcut icon" type="image/x-icon"/>
</head>
<body role="document">

    <!-- Navbar -->
    <div id="main-navbar" class="navbar navbar-default navbar-fixed-top">
        <div class="wu-navbar-header navbar-header">
            <#include "include/navheader.ftl">
        </div>
        <div class="navbar-collapse collapse navbar-responsive-collapse">
            <#include "include/navbar.ftl">
        </div><!-- /.nav-collapse -->
    </div>
    <!-- / Navbar -->

    <div class="container-fluid" role="main">
        <div class="row">
            <div class="page-header page-header-no-border">
                <h1>
                    <div class="main">Server Resource Report</div>
                    <div class="path">${reportModel.projectModel.rootFileModel.fileName}</div>
                </h1>
                <div class="desc">
                    This reports lists the resources of the application that are supposed to be used by the server,
                    such as datasources, JMS destinations, JMS connection factories, JMS connection factory list, and thread pools.
                </div>
            </div>
        </div>

        <div class="row">
            <div class="container-fluid theme-showcase" role="main">

            <#list reportModel.relatedResources.datasources.list.iterator()>
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h3 class="panel-title">DataSources</h3>
                    </div>
                    <table class="table table-striped table-bordered">
                    <tr>
                        <th class="col-md-4">JNDI Location</th>
                        <th class="col-md-2">Database</th>
                        <th class="col-md-6">Links</th>
                    </tr>

                    <#items as datasource>
                        <tr>
                            <td>${datasource.jndiLocation}</td>
                            <td>
                                <#if datasource.databaseTypeName??>
                                    ${datasource.databaseTypeName}<#if datasource.databaseTypeVersion??> ${datasource.databaseTypeVersion}</#if>
                                </#if>
                            </td>
                            <td><@render_link model=datasource project=reportModel.projectModel layout='horizontal'/></td>
                        </tr>
                    </#items>
                    </table>
                </div>
            </#list>


            <#list reportModel.relatedResources.jmsDestinations.list.iterator()>
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h3 class="panel-title">JMS Destinations</h3>
                    </div>
                    <table class="table table-striped table-bordered">
                    <tr>
                        <th class="col-md-4">JNDI Location</th>
                        <th class="col-md-2">Destination Type</th>
                        <th>Links</th>
                    </tr>
                    <#items as jmsDestination>
                        <tr>
                            <td>${jmsDestination.jndiLocation}</td>
                            <td><#if jmsDestination.destinationType??>${jmsDestination.destinationType}</#if></td>
                            <td><@render_link model=jmsDestination project=reportModel.projectModel layout='horizontal'/></td>
                        </tr>
                    </#items>
                    </table>
                </div>
            </#list>

            <#list reportModel.relatedResources.jmsConnectionFactories.list.iterator()>
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h3 class="panel-title">JMS Connection Factories</h3>
                    </div>
                    <table class="table table-striped table-bordered">
                    <tr>
                        <th>JNDI Location</th>
                        <th>Connection Factory Type</th>
                        <th>Links</th>
                    </tr>
                    <#items as jmsConnectionFactory>
                        <tr>
                            <td>${jmsConnectionFactory.jndiLocation}</td>
                            <td><#if jmsConnectionFactory.connectionFactoryType??>${jmsConnectionFactory.connectionFactoryType}</#if></td>
                            <td></td>
                        </tr>
                    </#items>
                    </table>
                </div>
            </#list>

            <#list reportModel.relatedResources.threadPools.list.iterator()>
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h3 class="panel-title">Thread Pools</h3>
                    </div>
                    <table class="table table-striped table-bordered">
                    <tr>
                        <th class="col-md-4">Pool Name</th>
                        <th class="col-md-1">Max Size</th>
                        <th class="col-md-1">Min Size</th>
                        <th class="col-md-6">Links</th>
                    </tr>

                    <#items as threadPool>
                        <tr>
                            <td>${threadPool.poolName!""}</td>
                            <td>${threadPool.maxPoolSize!""}</td>
                            <td>${threadPool.minPoolSize!""}</td>
                            <td><@render_link model=threadPool project=reportModel.projectModel layout='horizontal'/></td>
                        </tr>
                    </#items>
                    </table>
                </div>
            </#list>



            <#list reportModel.relatedResources.otherResources.list.iterator()>
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h3 class="panel-title">Other JNDI Entries</h3>
                    </div>
                    <table class="table table-striped table-bordered">
                    <tr>
                        <th>JNDI Location</th>
                    </tr>
                    <#items as other>
                        <tr>
                            <td>${other.jndiLocation}</td>
                        </tr>
                    </#items>
                    </table>
                </div>
            </#list>

        </div> <!-- /container -->
    </div><!--/row-->
    <#include "include/timestamp.ftl">
    </div><!-- /container main-->

    <script src="resources/js/jquery-1.10.1.min.js"></script>
    <script src="resources/js/bootstrap.min.js"></script>
</body>
</html>