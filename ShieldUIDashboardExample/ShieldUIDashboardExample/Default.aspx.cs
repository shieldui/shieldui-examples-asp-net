using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Shield.Web.UI;

namespace ShieldUIDashboardExample
{
	public partial class _Default : Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
			{
				var scriptReference = new ScriptReference("//demos.shieldui.com/Content/Json/gridData.js");
				var mgr = ScriptManager.GetCurrent(this.Page);
				mgr.Scripts.Add(scriptReference);
			}
		}

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
	}
}