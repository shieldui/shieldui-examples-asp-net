# Shield UI Grid ASP.NET Example

## Introduction

The [Shield UI ASP.NET suite](https://www.shieldui.com/products/aspnet) offers ASP.NET server-side wrappers for our JavaScript controls - 
Chart, Grid, Combo and Input components, Barcode Suite, QR Code and many more of the over 70 widget types. 
This brings client-side performance to the comfort of Visual Studio.

## Using Shield UI Grid ASP.NET Wrapper example

1) Create a new Web Project in Visual Studio 2015.

2) In the Web Project options select Web Forms, give a name for your project and finish its creation.

3) Download Shield.Web.UI dll from www.shieldui.com and paste it in your project's bin folder or in another custom created folder in the project.

4) In the Solution Explorer add a reference to Shield.Web.UI dll.

5) In the head section of your Site.Master page add a link to the ShieldUI styles:

```html
<link id="themecss" rel="stylesheet" type="text/css" href="//www.shieldui.com/shared/components/latest/css/light/all.min.css" />
```
		
6) In the ScriptManager section of your Sitem.Master page add a ScriptReference to the ShieldUI minified JavaScript file:

```asp
<asp:ScriptReference Path="//www.shieldui.com/shared/components/latest/js/shieldui-all.min.js" />
```

*NOTE:* It should be added after the jQuery ScriptReference 

7) In your Default.aspx start page, after the Page directive, register your Shield.Web.UI dll:

```asp
<%@ Register Assembly="Shield.Web.UI" Namespace="Shield.Web.UI" TagPrefix="shield" %>
```
		
8) To fill your grid with data, there are many ways. We use a JavaScript file on www.shieldui.com with data prepared for the grid. 
For that purpose we add some code in the Page_Load method of the Default.aspx page in the code behind:

```cs
protected void Page_Load(object sender, EventArgs e)
{
	if (!IsPostBack)
	{
		var scriptReference = new ScriptReference("//demos.shieldui.com/Content/Json/gridData.js");
		var mgr = ScriptManager.GetCurrent(this.Page);
		mgr.Scripts.Add(scriptReference);
	}
}
		
9) In the Content placeholder of your Default.aspx page add the code for your DataSource and your Grid:

```asp
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
```

10) Now build and start your application and you should have your grid displayed and filled with data on your start page - Default.aspx.

## More Samples

More live examples of the Shield UI framework can be found on [their website](http://demos.shieldui.com/aspnet/).

