/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.ckeditor.samples;

/**
 *
 * @author Suman
 */
 
import java.util.ArrayList;
import java.util.List;
 
import com.ckeditor.CKEditorConfig;
import com.ckeditor.EventHandler;
import com.ckeditor.GlobalEventHandler;
 
public class ConfigurationHelper {
 
 
	public static CKEditorConfig createConfig() {
		CKEditorConfig config = new CKEditorConfig();
		List<List<String>> list = new ArrayList<List<String>>();
		List<String> subList = new ArrayList<String>();
		subList.add("Source");
		subList.add("-");
		subList.add("Bold");
		subList.add("Italic");
		list.add(subList);
		config.addConfigValue("toolbar", list);
		config.addConfigValue("width","500");
		return config;
	}
 
	public static EventHandler createEventHandlers() {
		EventHandler handler = new EventHandler();
	// 	handler.addEvent("instanceReady","function (ev) { alert(\"Loaded: \" + ev.editor.name); }");
                 handler.addEventHandler("instanceReday", "function(ev){alert(\"Loaded:\" + ev.editor.name)}");
		return handler;
	}
 
	public static GlobalEventHandler createGlobalEventHandlers() {
		GlobalEventHandler handler = new GlobalEventHandler();
                handler.addEventHandler("instanceReday", "function(ev){alert(\"Loaded:\" + ev.editor.name)}");
		// handler.addEvent("dialogDefinition","function (ev) {  alert(\"Loading dialog window: \" + ev.data.name); }");
		return handler;
	}
}