<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ShieldUIGridExample._Default" %>

<%@ Register Assembly="Shield.Web.UI" Namespace="Shield.Web.UI" TagPrefix="shield" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <shield:ShieldDataSource runat="server" ID="shieldDataSource" Data="gridData"></shield:ShieldDataSource>
    <shield:ShieldGrid ID="ShieldGrid1" runat="server" ClientDataSourceID="shieldDataSource">
        <Sorting Multiple="true" />
        <Paging PageLinksCount="10" PageSize="12">
        </Paging>
        <Selection Type="Row" Multiple="true" Toggle="false" />
        <Columns>
            <shield:GridColumn Field="id" Width="70px" Title="ID"></shield:GridColumn>
            <shield:GridColumn Field="name" Title="Person Name"></shield:GridColumn>
            <shield:GridColumn Field="company" Title="Company Name"></shield:GridColumn>
            <shield:GridColumn Field="email" Width="270px" Title="Email Address"></shield:GridColumn>
        </Columns>
    </shield:ShieldGrid>
   

</asp:Content>
