﻿//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ICC
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    using System.Data.Objects;
    using System.Data.Objects.DataClasses;
    using System.Linq;
    
    public partial class ICCEntities : DbContext
    {
        public ICCEntities()
            : base("name=ICCEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public DbSet<TRX_DYR_Plantilla_Detalle_Cuenca> TRX_DYR_Plantilla_Detalle_Cuenca { get; set; }
        public DbSet<TRX_DYR_Plantilla_Detalle_Seccion> TRX_DYR_Plantilla_Detalle_Seccion { get; set; }
        public DbSet<TRX_DYR_Movil> TRX_DYR_Movil { get; set; }
        public DbSet<TRX_DYR_Movil_Detalle> TRX_DYR_Movil_Detalle { get; set; }
        public DbSet<TRX_Solicitud_Detalle_Cuenca> TRX_Solicitud_Detalle_Cuenca { get; set; }
        public DbSet<TRX_Solicitud_Detalle_Seccion> TRX_Solicitud_Detalle_Seccion { get; set; }
        public DbSet<TRX_Solicitud> TRX_Solicitud { get; set; }
        public DbSet<CAT_STD_Boletin> CAT_STD_Boletin { get; set; }
        public DbSet<TRX_DYR_Movil_YoReporto> TRX_DYR_Movil_YoReporto { get; set; }
        public DbSet<VW_Plantilla_Movil> VW_Plantilla_Movil { get; set; }
        public DbSet<CAT_STD_Municipio> CAT_STD_Municipio { get; set; }
        public DbSet<TRX_DYR_Plantilla_Encabezado> TRX_DYR_Plantilla_Encabezado { get; set; }
    
        public virtual ObjectResult<xSpCuencas_Result> xSpCuencas()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<xSpCuencas_Result>("xSpCuencas");
        }
    
        public virtual ObjectResult<xSpSecciones_Result> xSpSecciones()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<xSpSecciones_Result>("xSpSecciones");
        }
    
        public virtual int xSpCrearPlantilla(Nullable<int> pTRXID, string pSubCuencas, string pSubSecciones)
        {
            var pTRXIDParameter = pTRXID.HasValue ?
                new ObjectParameter("pTRXID", pTRXID) :
                new ObjectParameter("pTRXID", typeof(int));
    
            var pSubCuencasParameter = pSubCuencas != null ?
                new ObjectParameter("pSubCuencas", pSubCuencas) :
                new ObjectParameter("pSubCuencas", typeof(string));
    
            var pSubSeccionesParameter = pSubSecciones != null ?
                new ObjectParameter("pSubSecciones", pSubSecciones) :
                new ObjectParameter("pSubSecciones", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("xSpCrearPlantilla", pTRXIDParameter, pSubCuencasParameter, pSubSeccionesParameter);
        }
    
        public virtual ObjectResult<xSpBuscarInformacionYoReporto_Result> xSpBuscarInformacionYoReporto(string tipoReporte_DSC, string departamento_DSC, string municipio_DSC)
        {
            var tipoReporte_DSCParameter = tipoReporte_DSC != null ?
                new ObjectParameter("TipoReporte_DSC", tipoReporte_DSC) :
                new ObjectParameter("TipoReporte_DSC", typeof(string));
    
            var departamento_DSCParameter = departamento_DSC != null ?
                new ObjectParameter("Departamento_DSC", departamento_DSC) :
                new ObjectParameter("Departamento_DSC", typeof(string));
    
            var municipio_DSCParameter = municipio_DSC != null ?
                new ObjectParameter("Municipio_DSC", municipio_DSC) :
                new ObjectParameter("Municipio_DSC", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<xSpBuscarInformacionYoReporto_Result>("xSpBuscarInformacionYoReporto", tipoReporte_DSCParameter, departamento_DSCParameter, municipio_DSCParameter);
        }
    
        public virtual ObjectResult<Nullable<int>> xSPAccesos(string uri, string usuario_ID)
        {
            var uriParameter = uri != null ?
                new ObjectParameter("Uri", uri) :
                new ObjectParameter("Uri", typeof(string));
    
            var usuario_IDParameter = usuario_ID != null ?
                new ObjectParameter("Usuario_ID", usuario_ID) :
                new ObjectParameter("Usuario_ID", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<Nullable<int>>("xSPAccesos", uriParameter, usuario_IDParameter);
        }
    
        public virtual ObjectResult<xSpHtml_Result> xSpHtml(Nullable<int> pSolicitudID)
        {
            var pSolicitudIDParameter = pSolicitudID.HasValue ?
                new ObjectParameter("pSolicitudID", pSolicitudID) :
                new ObjectParameter("pSolicitudID", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<xSpHtml_Result>("xSpHtml", pSolicitudIDParameter);
        }
    
        public virtual ObjectResult<xSPPermisos_Result> xSPPermisos(string correoElectronico)
        {
            var correoElectronicoParameter = correoElectronico != null ?
                new ObjectParameter("CorreoElectronico", correoElectronico) :
                new ObjectParameter("CorreoElectronico", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<xSPPermisos_Result>("xSPPermisos", correoElectronicoParameter);
        }
    
        public virtual ObjectResult<xSpHtmlRecuperacion_Result> xSpHtmlRecuperacion(string correoElectronico)
        {
            var correoElectronicoParameter = correoElectronico != null ?
                new ObjectParameter("CorreoElectronico", correoElectronico) :
                new ObjectParameter("CorreoElectronico", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<xSpHtmlRecuperacion_Result>("xSpHtmlRecuperacion", correoElectronicoParameter);
        }
    
        public virtual ObjectResult<xSpBuscarInformacionCuenca_Result> xSpBuscarInformacionCuenca(string guid_ID, string cuenca_DSC, string subCuencaRio_DSC, string puntoMonitoreo_DSC, string modeloMolinete_DSC, string tipoMedicion_DSC, string tipologia_DSC, string estado_DSC)
        {
            var guid_IDParameter = guid_ID != null ?
                new ObjectParameter("Guid_ID", guid_ID) :
                new ObjectParameter("Guid_ID", typeof(string));
    
            var cuenca_DSCParameter = cuenca_DSC != null ?
                new ObjectParameter("Cuenca_DSC", cuenca_DSC) :
                new ObjectParameter("Cuenca_DSC", typeof(string));
    
            var subCuencaRio_DSCParameter = subCuencaRio_DSC != null ?
                new ObjectParameter("SubCuencaRio_DSC", subCuencaRio_DSC) :
                new ObjectParameter("SubCuencaRio_DSC", typeof(string));
    
            var puntoMonitoreo_DSCParameter = puntoMonitoreo_DSC != null ?
                new ObjectParameter("PuntoMonitoreo_DSC", puntoMonitoreo_DSC) :
                new ObjectParameter("PuntoMonitoreo_DSC", typeof(string));
    
            var modeloMolinete_DSCParameter = modeloMolinete_DSC != null ?
                new ObjectParameter("ModeloMolinete_DSC", modeloMolinete_DSC) :
                new ObjectParameter("ModeloMolinete_DSC", typeof(string));
    
            var tipoMedicion_DSCParameter = tipoMedicion_DSC != null ?
                new ObjectParameter("TipoMedicion_DSC", tipoMedicion_DSC) :
                new ObjectParameter("TipoMedicion_DSC", typeof(string));
    
            var tipologia_DSCParameter = tipologia_DSC != null ?
                new ObjectParameter("Tipologia_DSC", tipologia_DSC) :
                new ObjectParameter("Tipologia_DSC", typeof(string));
    
            var estado_DSCParameter = estado_DSC != null ?
                new ObjectParameter("Estado_DSC", estado_DSC) :
                new ObjectParameter("Estado_DSC", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<xSpBuscarInformacionCuenca_Result>("xSpBuscarInformacionCuenca", guid_IDParameter, cuenca_DSCParameter, subCuencaRio_DSCParameter, puntoMonitoreo_DSCParameter, modeloMolinete_DSCParameter, tipoMedicion_DSCParameter, tipologia_DSCParameter, estado_DSCParameter);
        }
    }
}
