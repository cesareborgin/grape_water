package grape.utils;
import java.util.List;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.reflect.TypeToken;
public class GsonUtils {
	private static Gson gson=new GsonBuilder().setDateFormat("yyyy/MM/dd HH:mm").create();
	public static String object2json(Object o){
		return gson.toJson(o);
	}
	@SuppressWarnings("unchecked")
	public static Object json2object(String s,@SuppressWarnings("rawtypes") Class c){
		return gson.fromJson(s, c);
	}
	@SuppressWarnings("rawtypes")
	public static List json2list(String s,TypeToken tt){
		return gson.fromJson(s, tt.getType()); 
	}
}
