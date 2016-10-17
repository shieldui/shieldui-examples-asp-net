<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ShieldUIDashboardExample._Default" %>

<%@ Register Assembly="Shield.Web.UI" Namespace="Shield.Web.UI" TagPrefix="shield" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="row">
        <div class="col-lg-12">
            <h1>Dashboard <small>Dashboard Home</small></h1>
            <div class="alert alert-success alert-dismissable">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                Welcome to the admin dashboard! Feel free to review all pages and modify the layout to your needs. 
                       
                    <br />
                This theme uses the <a href="https://www.shieldui.com">ShieldUI</a> JavaScript library for the 
                        additional data visualization and presentation functionality illustrated here.
                   
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-3">
            <div class="panel panel-default ">
                <div class="panel-body alert-info">
                    <div class="col-xs-5">
                        <i class="fa fa-truck fa-5x"></i>
                    </div>
                    <div class="col-xs-5 text-right">
                        <p class="alerts-heading">343</p>
                        <p class="alerts-text">New Orders</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-3">
            <div class="panel panel-default ">
                <div class="panel-body alert-info">
                    <div class="col-xs-5">
                        <i class="fa fa-money fa-5x"></i>
                    </div>
                    <div class="col-xs-5 text-right">
                        <p class="alerts-heading">17453</p>
                        <p class="alerts-text">Income</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-3">
            <div class="panel panel-default ">
                <div class="panel-body alert-info">
                    <div class="col-xs-5">
                        <i class="fa fa-twitter fa-5x"></i>
                    </div>
                    <div class="col-xs-5 text-right">
                        <p class="alerts-heading">743</p>
                        <p class="alerts-text">Mentions</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-3">
            <div class="panel panel-default ">
                <div class="panel-body alert-info">
                    <div class="col-xs-5">
                        <i class="fa fa-download fa-5x"></i>
                    </div>
                    <div class="col-xs-5 text-right">
                        <p class="alerts-heading">1453</p>
                        <p class="alerts-text">Downloads</p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-lg-8">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title"><i class="fa fa-bar-chart-o"></i>Sales personnel Data</h3>
                </div>
                <div class="panel-body">
                    <shield:ShieldDataSource runat="server" ID="shieldDataSource" Data="gridData"></shield:ShieldDataSource>
                    <shield:ShieldGrid ID="ShieldGrid1" runat="server" ClientDataSourceID="shieldDataSource">
                        <Sorting Multiple="true" />
                        <Paging PageLinksCount="4" PageSize="7">
                        </Paging>
                        <Selection Type="Row" Multiple="true" Toggle="false" />
                        <Columns>
                            <shield:GridColumn Field="id" Width="70px" Title="ID"></shield:GridColumn>
                            <shield:GridColumn Field="name" Title="Person Name"></shield:GridColumn>
                            <shield:GridColumn Field="company" Title="Company Name"></shield:GridColumn>
                            <shield:GridColumn Field="email" Width="270px" Title="Email Address"></shield:GridColumn>
                        </Columns>
                    </shield:ShieldGrid>
                </div>
            </div>
        </div>
        <div class="col-lg-4">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title"><i class="fa fa-bar-chart-o"></i>Logins per week</h3>
                </div>
                <div class="panel-body">
                    <shield:ShieldChart ID="ShieldChart2" runat="server" Width="100%" OnTakeDataSource="InitChart2Data">
                        <PrimaryHeader Text="Login Data" />
                        <ExportOptions AllowExportToImage="false" AllowPrint="false" />
                        <DataSeries>
                            <shield:ChartPolarBarSeries DataFieldY="Logins" CollectionAlias="Logins" />
                            <shield:ChartPolarBarSeries DataFieldY="AvgVisits" CollectionAlias="Avg Visit Duration" />
                        </DataSeries>
                    </shield:ShieldChart>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title"><i class="fa fa-bar-chart-o"></i>Sales Data</h3>
                </div>
                <div class="panel-body">
                    <shield:ShieldChart ID="ShieldChart3" runat="server" Width="100%" Height="400px" OnTakeDataSource="InitChart3Data">
                        <PrimaryHeader Text="Sales Data" />
                        <DataSeries>
                            <shield:ChartBarSeries DataFieldY="Budget" CollectionAlias="Budget" />
                            <shield:ChartBarSeries DataFieldY="Sales" CollectionAlias="Sales" />
                            <shield:ChartSplineSeries DataFieldY="Targets" CollectionAlias="Targets" />
                        </DataSeries>
                    </shield:ShieldChart>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
