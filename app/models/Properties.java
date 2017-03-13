
package models;

import java.util.HashMap;
import java.util.Map;
import com.fasterxml.jackson.annotation.JsonAnyGetter;
import com.fasterxml.jackson.annotation.JsonAnySetter;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonPropertyOrder;

@JsonInclude(JsonInclude.Include.NON_NULL)
@JsonPropertyOrder({
    "NAME",
    "TEL",
    "URL",
    "ADDRESS1",
    "ADDRES2",
    "CITY",
    "ZIP"
})
public class Properties {

    @JsonProperty("NAME")
    private String nAME;
    @JsonProperty("TEL")
    private String tEL;
    @JsonProperty("URL")
    private String uRL;
    @JsonProperty("ADDRESS1")
    private String aDDRESS1;
    @JsonProperty("ADDRES2")
    private String aDDRES2;
    @JsonProperty("CITY")
    private String cITY;
    @JsonProperty("ZIP")
    private Double zIP;
    @JsonProperty("DESCRIPTION")
    private String dESCRIPTION;
    @JsonIgnore
    private Map<String, Object> additionalProperties = new HashMap<String, Object>();

    @JsonProperty("NAME")
    public String getNAME() {
        return nAME;
    }

    @JsonProperty("NAME")
    public void setNAME(String nAME) {
        this.nAME = nAME;
    }

    @JsonProperty("TEL")
    public String getTEL() {
        return tEL;
    }

    @JsonProperty("TEL")
    public void setTEL(String tEL) {
        this.tEL = tEL;
    }

    @JsonProperty("URL")
    public String getURL() {
        return uRL;
    }

    @JsonProperty("URL")
    public void setURL(String uRL) {
        this.uRL = uRL;
    }

    @JsonProperty("ADDRESS1")
    public String getADDRESS1() {
        return aDDRESS1;
    }

    @JsonProperty("ADDRESS1")
    public void setADDRESS1(String aDDRESS1) {
        this.aDDRESS1 = aDDRESS1;
    }

    @JsonProperty("ADDRES2")
    public String getADDRES2() {
        return aDDRES2;
    }

    @JsonProperty("ADDRES2")
    public void setADDRES2(String aDDRES2) {
        this.aDDRES2 = aDDRES2;
    }

    @JsonProperty("CITY")
    public String getCITY() {
        return cITY;
    }

    @JsonProperty("CITY")
    public void setCITY(String cITY) {
        this.cITY = cITY;
    }

    @JsonProperty("ZIP")
    public Double getZIP() {
        return zIP;
    }

    @JsonProperty("ZIP")
    public void setZIP(Double zIP) {
        this.zIP = zIP;
    }


    @JsonProperty("DESCRIPTION")
    public String getDESCRIPTION() {
        return dESCRIPTION;
    }

    @JsonProperty("DESCRIPTION")
    public void setDESCRIPTION(String DESCRIPTION) {
        this.dESCRIPTION = DESCRIPTION;
    }


    @JsonAnyGetter
    public Map<String, Object> getAdditionalProperties() {
        return this.additionalProperties;
    }

    @JsonAnySetter
    public void setAdditionalProperty(String name, Object value) {
        this.additionalProperties.put(name, value);
    }

}
