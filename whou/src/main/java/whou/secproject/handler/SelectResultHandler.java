package whou.secproject.handler;

import org.apache.ibatis.session.ResultContext;
import org.apache.ibatis.session.ResultHandler;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class SelectResultHandler<T> implements ResultHandler<HashMap<String, T>> {

    private final List<HashMap<String, T>> sel = new ArrayList<>();

    @Override
    public void handleResult(ResultContext<? extends HashMap<String, T>> resultContext) {
        HashMap<String, T> object = resultContext.getResultObject();
        sel.add(object); // 결과를 리스트에 추가하거나 다른 작업을 수행할 수 있음
    }

    public List<HashMap<String, T>> getSel() {
        return sel;
    }

    public HashMap<String, T> getSelOne() {
    	if(sel.size()==0) return null;
        return sel.get(0);
    }
}

