package org.mutoss.config;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class ClassConfig {
	protected static Log logger = LogFactory.getLog(ClassConfig.class);
    private Configuration conf;
    private Class c;
    
	/**
	 * Constructor
	 * @param conf SpecificConfig object
	 */
    public ClassConfig(Configuration conf, Class c) {
        this.conf = conf;
        this.c = c;
    }

    public Configuration getConf() {
        return conf;
    }

    public String getProperty(String prop) {
        return getConf().getClassProperty(c, prop);
    }

    public String getProperty(String prop, String def) {
        return getConf().getClassProperty(c, prop, def);
    }

    public void setProperty(String prop, String val) {
        getConf().setClassProperty(c, prop, val);
    }

    public int getIntProperty(String prop, int def){
        return Integer.parseInt(getConf().getClassProperty(c, prop, ""+def));
    }

    public double getDoubleProperty(String prop, double def){
        return Double.parseDouble(getConf().getClassProperty(c, prop, ""+def));
    }

    public boolean getBoolProperty(String prop, boolean def){
        return Boolean.parseBoolean(getConf().getClassProperty(c, prop, ""+def));
    }

    public void setIntProperty(String prop, int val) {
        setProperty(prop, ""+val);
    }

    public void setDoubleProperty(String prop, double val) {
        setProperty(prop, ""+val);
    }

    public void setBoolProperty(String prop, boolean val) {
        setProperty(prop, ""+val);
    }


}
