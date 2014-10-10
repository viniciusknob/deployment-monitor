package br.com.jarvis.converter;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import br.com.caelum.vraptor.Convert;
import br.com.caelum.vraptor.converter.Converter;

@Convert(Date.class)  
public class DateConverter implements Converter<Date> {
	private static final SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");

	@Override
	public Date convert(String value, Class<? extends Date> dateType) {
		try {  
            return format.parse(value);  
        } catch (ParseException e) {  
            return null;  
        }  
	}
}
