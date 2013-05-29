
package util;

import java.util.List;
import javax.faces.model.DataModel;

/**
 * Controlar algunos mensajes de error y traer(lista o Datamodel segun sea el caso)
 */

public class ClaseResultado {
    
    private String msjerror = "";
    private String msjexception = "";
    private boolean error;
    private List list;
    private DataModel datamodel;

    /**
     * @return the msjerror
     */
    public String getMsjerror() {
        return msjerror;
    }

    /**
     * @param msjerror the msjerror to set
     */
    public void setMsjerror(String msjerror) {
        this.msjerror = msjerror;
    }

    /**
     * @return the msjexception
     */
    public String getMsjexception() {
        return msjexception;
    }

    /**
     * @param msjexception the msjexception to set
     */
    public void setMsjexception(String msjexception) {
        this.msjexception = msjexception;
    }

    /**
     * @return the error
     */
    public boolean isError() {
        return error;
    }

    /**
     * @param error the error to set
     */
    public void setError(boolean error) {
        this.error = error;
    }

    /**
     * @return the list
     */
    public List getList() {
        return list;
    }

    /**
     * @param list the list to set
     */
    public void setList(List list) {
        this.list = list;
    }

    /**
     * @return the datamodel
     */
    public DataModel getDatamodel() {
        return datamodel;
    }

    /**
     * @param datamodel the datamodel to set
     */
    public void setDatamodel(DataModel datamodel) {
        this.datamodel = datamodel;
    }
    
}
