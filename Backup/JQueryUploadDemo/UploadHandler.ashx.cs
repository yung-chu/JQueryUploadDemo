using System;
using System.Collections.Generic;
using System.Linq;
using System.IO;
using System.Net;
using System.Threading;
using System.Web;
using System.Web.Services;


namespace JQueryUploadDemo
{
	/// <summary>
	/// $codebehindclassname$ 的摘要说明
	/// </summary>
	[WebService(Namespace = "http://tempuri.org/")]
	[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]

	public class UploadHandler : IHttpHandler
	{
		public void ProcessRequest(HttpContext context)
		{
			context.Response.ContentType = "text/plain";
			context.Response.Charset = "utf-8";

			HttpPostedFile file = context.Request.Files["files"];
			string uploadPath =
				HttpContext.Current.Server.MapPath(@context.Request["folder"]) + "\\";

			if (file != null)
			{
				if (!Directory.Exists(uploadPath))
				{
					Directory.CreateDirectory(uploadPath);
				}
				file.SaveAs(uploadPath + file.FileName);
				//下面这句代码缺少的话，上传成功后上传队列的显示不会自动消失
				string newName = file.FileName;
				string oldName = file.FileName;
				context.Response.Write("{\"newName\": \"" + newName + "\", \"oldName\": \"" + oldName + "\"}");
			}
			else
			{
				context.Response.Write("0");
			}
		}

		public bool IsReusable
		{
			get
			{
				return false;
			}
		}
	}
}
