# Shield UI Dashboard ASP.NET Example

## Introduction

The [Shield UI ASP.NET suite](https://www.shieldui.com/products/aspnet) offers ASP.NET server-side wrappers for our JavaScript controls - 
Chart, Grid, Combo and Input components, Barcode Suite, QR Code and many more of the over 70 widget types. 
This brings client-side performance to the comfort of Visual Studio.

## Using Shield UI Dashboard ASP.NET example:

1) Create a new Web Project in Visual Studio 2015.

2) In the Web Project options select Web Forms, give a name for your project and finish its creation.

3) Download Shield.Web.UI dll from www.shieldui.com and paste it in your project's bin folder or in another custom created folder in the project.

4) In the Solution Explorer add a reference to Shield.Web.UI dll.

5) In the head section of your Site.Master page add a link to the ShieldUI styles:

```html
<link id="themecss" rel="stylesheet" type="text/css" href="//www.shieldui.com/shared/components/latest/css/light/all.min.css" />
```

6) In the ScriptManager section of your Sitem.Master page add a ScriptReference to the ShieldUI minified JavaScript file:

```html
<asp:ScriptReference Path="//www.shieldui.com/shared/components/latest/js/shieldui-all.min.js" />
```
		
**NOTE:** It should be added after the jQuery ScriptReference.

7) In your Default.aspx start page, after the Page directive, register your Shield.Web.UI dll:

```asp
<%@ Register Assembly="Shield.Web.UI" Namespace="Shield.Web.UI" TagPrefix="shield" %>
```

8) Download the free Deep Blue Admin dashboard theme from [PrepBootstrap](http://www.prepbootstrap.com/bootstrap-theme/deepblue-admin).

9) Unzip the theme and copy the font-awesome folder in the Content folder of the project.

10) Include that content in the Site.Master page:

```html
<link rel="stylesheet" type="text/css" href="/Content/font-awesome/css/font-awesome.min.css" />
```
	
11) Copy the content of index.html of the theme into the ContentPlaceholder of Default.aspx page without the links.

12) Remove the JavaScript code in the script tag from the copied source.

13) Replace the shieldui-grid1 div with the wrapper code:

```asp
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
```

14) Replace the shieldui-chart2 div with the wrapper code:

```asp
<shield:ShieldChart ID="ShieldChart2" runat="server" Width="100%" OnTakeDataSource="InitChart2Data">
	<PrimaryHeader Text="Login Data" />
	<ExportOptions AllowExportToImage="false" AllowPrint="false" />
	<DataSeries>
		<shield:ChartPolarBarSeries DataFieldY="Logins" CollectionAlias="Logins" />
		<shield:ChartPolarBarSeries DataFieldY="AvgVisits" CollectionAlias="Avg Visit Duration" />
	</DataSeries>
</shield:ShieldChart>
```
		
15) Replace the shieldui-chart3 div with the wrapper code:

```asp
<shield:ShieldChart ID="ShieldChart3" runat="server" Width="100%" Height="400px" OnTakeDataSource="InitChart3Data">
	<PrimaryHeader Text="Sales Data" />
	<DataSeries>
		<shield:ChartBarSeries DataFieldY="Budget" CollectionAlias="Budget" />
		<shield:ChartBarSeries DataFieldY="Sales" CollectionAlias="Sales" />
		<shield:ChartSplineSeries DataFieldY="Targets" CollectionAlias="Targets" />
	</DataSeries>
</shield:ShieldChart>
```

16) To fill your grid with data, there are many ways. I will use a js file on www.shieldui.com with data prepared for the grid. 
For that purpose, we need to add some code in the Page_Load method of the Default.aspx page in the code behind:

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
```
		
17) Put the source for the TakeDateSource event of both charts in the Default.cs code behind:

```cs
protected void InitChart2Data(object sender, ChartTakeDataSourceEventArgs e)
{
	this.ShieldChart2.DataSource = new Data[] 
	{
		new Data { Logins = 123, AvgVisits = 117 },
		new Data { Logins = 323, AvgVisits = 119 },
		new Data { Logins = 143, AvgVisits = 95 },
		new Data { Logins = 132, AvgVisits = 114 },
		new Data { Logins = 274, AvgVisits = 162 },
		new Data { Logins = 223, AvgVisits = 162 },
		new Data { Logins = 143, AvgVisits = 175 },
		new Data { Logins = 156, AvgVisits = 112 },
		new Data { Logins = 223, AvgVisits = 147 },
		new Data { Logins = 223, AvgVisits = 155 },
		new Data { Logins = 0, AvgVisits = 265 },
		new Data { Logins = 0, AvgVisits = 167 }
	};
}

protected void InitChart3Data(object sender, ChartTakeDataSourceEventArgs e)
{
	this.ShieldChart3.DataSource = new MixedData[]
	{
		new MixedData { Budget = 23, Sales = 11, Targets = 17 },
		new MixedData { Budget = 19, Sales = 9, Targets = 19 },
		new MixedData { Budget = 11, Sales = 31, Targets = 5 },
		new MixedData { Budget = 34, Sales = 34, Targets = 4 },
		new MixedData { Budget = 42, Sales = 42, Targets = 62 },
		new MixedData { Budget = 52, Sales = 52, Targets = 62 },
		new MixedData { Budget = 35, Sales = 35, Targets = 75 },
		new MixedData { Budget = 22, Sales = 22, Targets = 12 },
		new MixedData { Budget = 37, Sales = 37, Targets = 47 },
		new MixedData { Budget = 45, Sales = 45, Targets = 55 },
		new MixedData { Budget = 55, Sales = 55, Targets = 65 },
		new MixedData { Budget = 57, Sales = 57, Targets = 67 }				
	};
}

private sealed class Data
{
	public int Logins { get; set; }
	public int AvgVisits { get; set; }
}

private sealed class MixedData
{
	public int Budget { get; set; }
	public int Sales { get; set; }
	public int Targets { get; set; }
}
```
	
18) Now build and start your application and you should have your dashboard displayed on your start page - Default.aspx.
