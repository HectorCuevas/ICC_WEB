using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ICC.Cuenta
{
    public partial class Solicitud : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void ASPxFormLayout1_E8_Click(object sender, EventArgs e)
        {
            try
            {
                using (ICCEntities lObjEntidad = new ICCEntities())
                {
                    TRX_Solicitud lObjSolicitud = new TRX_Solicitud();
                    lObjSolicitud = (from p in lObjEntidad.TRX_Solicitud
                                     where p.CorreoElectronico == ASPxFormLayout1_E6.Text
                                     select p).FirstOrDefault();
                    if (lObjSolicitud != null)
                        throw new Exception("Correo electrónico ya ha realizado solicitud anteriormente.");
                    if (ASPxFormLayout1_E4.Text != ASPxFormLayout1_E9.Text)
                        throw new Exception("La contraseña no coindice, ingrese nuevamente la contraseña.");
                    if(ASPxFormLayout1_E6.Text.Trim().Length == 0)
                        throw new Exception("Es necesario ingresar un correo electrónico valido.");
                    if (ASPxFormLayout1_E4.Text.Trim().Length == 0)
                        throw new Exception("Es necesario ingresar una contraseña valida.");
                    if (ASPxFormLayout1_E9.Text.Trim().Length == 0)
                        throw new Exception("Es necesario ingresar una re-contraseña valida.");
                    if (ASPxFormLayout1_E2.Text.Trim().Length == 0)
                        throw new Exception("Es necesario ingresar nombre y apellidos.");
                    lObjSolicitud = new TRX_Solicitud();
                    lObjSolicitud.Contrasena = ASPxFormLayout1_E4.Text;
                    lObjSolicitud.CorreoElectronico = ASPxFormLayout1_E6.Text;
                    lObjSolicitud.Estado_ID = 1;
                    lObjSolicitud.NombresApellidos = ASPxFormLayout1_E2.Text;
                    lObjSolicitud.Organizacion_ID = Convert.ToInt32(ASPxFormLayout1_E3.SelectedItem.Value);
                    lObjSolicitud.Departamento_ID = Convert.ToInt32(ASPxFormLayout1_E1.SelectedItem.Value);
                    lObjSolicitud.Municipio_ID = Convert.ToInt32(ASPxFormLayout1_E5.SelectedItem.Value);
                    lObjEntidad.TRX_Solicitud.Add(lObjSolicitud);
                    lObjEntidad.SaveChanges();
                    Response.Redirect("~/");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        protected void ASPxFormLayout1_E10_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Cuenta/Inicio.aspx");
        }

        protected void ASPxFormLayout1_E5_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            SubBuscarMunicipios(Convert.ToInt32(e.Parameter));
        }

        protected void SubBuscarMunicipios(int lintCodigoDepartamento)
        {
            using (ICCEntities lObjIcc = new ICCEntities())
            {
                List<CAT_STD_Municipio> lObjMunicipios = new List<CAT_STD_Municipio>();
                ASPxFormLayout1_E5.Items.Clear();
                lObjMunicipios = (from p in lObjIcc.CAT_STD_Municipio
                                  where p.Departamento_ID == lintCodigoDepartamento
                                  select p).ToList();
                foreach (CAT_STD_Municipio lObjMunicipio in lObjMunicipios)
                {
                    ASPxFormLayout1_E5.Items.Add(lObjMunicipio.Municipio_DSC, lObjMunicipio.Municipio_ID);
                }
                if(lObjMunicipios.Count > 0)
                {
                    ASPxFormLayout1_E5.SelectedIndex = 0;
                }
            }
        }


    }
}