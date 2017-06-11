package com.boco.common.pay.wxpay.util;


import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.StringReader;
import java.io.UnsupportedEncodingException;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;
import javax.xml.bind.Unmarshaller;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


public class XmlUtil {


	/**
	 * XML转对象
	 * 
	 * @param xmlStr
	 * @param t
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public static <T> T xmlToBean(String xmlStr, Class<T> t) {
		try {
			JAXBContext context = JAXBContext.newInstance(t);
			Unmarshaller unmarshaller = context.createUnmarshaller();
			T ts = (T) unmarshaller.unmarshal(new StringReader(xmlStr));
			return ts;
		} catch (JAXBException e) {
			e.printStackTrace();
			return null;
		}
	}

	/**
	 * XML转对象
	 * 
	 * @param t
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public static <T> T xmlToBean(InputStream input, Class<T> t) {
		try {
			JAXBContext context = JAXBContext.newInstance(t);
			Unmarshaller unmarshaller = context.createUnmarshaller();
			T ts = (T) unmarshaller.unmarshal(new InputStreamReader(input,
					"UTF-8"));
			return ts;
		} catch (JAXBException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 对象转XML
	 * 
	 * @param out
	 * @param to
	 */
	public static String beanToXml(ByteArrayOutputStream out, Object to) {
		try {
			JAXBContext context = JAXBContext.newInstance(to.getClass());
			Marshaller marshaller = context.createMarshaller();
			marshaller.marshal(to, out);
			return new String(out.toByteArray(), "UTF-8");
		} catch (JAXBException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public static Map<String,Object> getMapFromXML(String xmlString) throws ParserConfigurationException, IOException, SAXException {

        //这里用Dom的方式解析回包的最主要目的是防止API新增回包字段
        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        DocumentBuilder builder = factory.newDocumentBuilder();
        InputStream is =  WeChatUtil.getStringStream(xmlString);
        Document document = (Document) builder.parse(is);

        //获取到document里面的全部结点
        NodeList allNodes = document.getFirstChild().getChildNodes();
        Node node;
        Map<String, Object> map = new HashMap<String, Object>();
        int i=0;
        while (i < allNodes.getLength()) {
            node = allNodes.item(i);
            if(node instanceof Element){
                map.put(node.getNodeName(),node.getTextContent());
            }
            i++;
        }
        return map;

    }

}
