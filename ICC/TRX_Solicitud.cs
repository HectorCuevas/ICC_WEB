//------------------------------------------------------------------------------
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
    using System.Collections.Generic;
    
    public partial class TRX_Solicitud
    {
        public int Solicitud_ID { get; set; }
        public int Organizacion_ID { get; set; }
        public string NombresApellidos { get; set; }
        public string CorreoElectronico { get; set; }
        public string Contrasena { get; set; }
        public int Estado_ID { get; set; }
        public Nullable<int> Departamento_ID { get; set; }
        public Nullable<int> Municipio_ID { get; set; }
        public Nullable<int> DYR_ID { get; set; }
    }
}
