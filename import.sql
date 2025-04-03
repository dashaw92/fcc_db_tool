DROP TABLE IF EXISTS AM;
DROP TABLE IF EXISTS EN;
.import header_AM.csv AM --csv
.import header_EN.csv EN --csv
DROP TABLE IF EXISTS FCC;
CREATE TABLE FCC AS
    SELECT AM.USI,AM.ULSFileNumber,AM.EBFNumber,AM.Call,AM.Class,AM.GroupCode,AM.RegionCode,
           AM.TrusteeCall,AM.TrusteeIndicator,AM.PhysicianCertification,AM.VESig,
           AM.SystCallChange,AM.HVCallChange,AM.VanityRel,AM.PrevCall,AM.PrevClass,
           AM.TrusteeName,EN.EntityType,EN.LicID,En.EntityName,EN.FirstName,EN.MI,EN.LastName,EN.Suffix,
           EN.Phone,EN.Fax,EN.Email,EN.StreetAddress,EN.City,EN.State,EN.ZipCode,
           EN.POBox,EN.Attn,EN.SGIN,EN.FRN,EN.ApplicantTypeCode,EN.ApplicantTypeCodeOther,
           EN.StatusCode,EN.StatusDate,EN.Microwave37GHzLicType,EN.LinkedUSI,EN.LinkedCall
    FROM AM INNER JOIN EN USING(USI);
DROP TABLE AM;
DROP TABLE EN;
