using DevExpress.Web;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ICC.Catalogo
{
    public partial class Boletin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!Page.IsPostBack)
            {
                subValidaciones();
            }
        }

        protected void ASPxGridView1_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {

        }

        protected void ASPxGridView1_DetailRowExpandedChanged(object sender, DevExpress.Web.ASPxGridViewDetailRowEventArgs e)
        {
            if (e.Expanded)
            {
                Session["xID"] = this.ASPxGridView1.GetRowValues(e.VisibleIndex, "CodigoBoletin");
                if (!Directory.Exists(MapPath("~/Boletines")))
                {
                    Directory.CreateDirectory(MapPath("~/Boletines"));
                }
                if (!Directory.Exists(MapPath("~/Boletines/" + Session["xID"])))
                {
                    Directory.CreateDirectory(MapPath("~/Boletines/" + Session["xID"]));
                }
                if (!Directory.Exists(MapPath("~/Thumb")))
                {
                    Directory.CreateDirectory(MapPath("~/Thumb"));
                }
            }
        }

        protected void ASPxFileManager1_FileUploading(object source, DevExpress.Web.FileManagerFileUploadEventArgs e)
        {
            DirectoryInfo di = new DirectoryInfo(MapPath("~/Boletines/" + Session["xID"]));
            foreach (FileInfo file in di.GetFiles())
            {
                file.Delete();
            }
            int lintCodigoBoletin = Convert.ToInt32(Session["xID"]);
            using (ICCEntities lObjEntidad = new ICCEntities())
            {
                CAT_STD_Boletin lobjBoletin = new CAT_STD_Boletin();
                lobjBoletin = (from p in lObjEntidad.CAT_STD_Boletin
                               where p.CodigoBoletin == lintCodigoBoletin
                               select p).FirstOrDefault();
                if (lobjBoletin != null)
                {
                    lobjBoletin.NombreArchivo = e.FileName;
                }
                lObjEntidad.SaveChanges();
            }
        }

        protected void ASPxFileManager1_Init(object sender, EventArgs e)
        {
            ASPxFileManager lObjFIleManager = (ASPxFileManager)sender;
            lObjFIleManager.Settings.RootFolder = MapPath("~/Boletines/" + Session["xID"]);
        }

        private void subValidaciones()
        {
            string lS = Path.GetFileName(Request.PhysicalPath);
            using (ICCEntities lobjEntidad = new ICCEntities())
            {
                int lintPermite = lobjEntidad.xSPAccesos(Path.GetFileName(Request.PhysicalPath), User.Identity.Name).FirstOrDefault().Value;
                if (lintPermite == 0)
                    Response.Redirect("~/Validaciones.aspx");
            }
        }

    }
}