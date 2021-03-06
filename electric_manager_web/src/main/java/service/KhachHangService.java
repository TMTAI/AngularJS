package service;

import com.mongodb.Block;
import com.mongodb.MongoClient;
import com.mongodb.client.FindIterable;
import com.mongodb.client.MongoCollection;
import ninja.Result;
import ninja.Results;
import ninja.params.Param;
import org.bson.Document;
import org.bson.types.ObjectId;
import org.json.JSONArray;
import org.json.JSONObject;
import static util.Constant.*;

/**
 * Created by tranm on 29-Jul-17.
 */
public class KhachHangService extends DatabaseUtility {

    private JSONObject createJSON(Document document){
        JSONObject json = new JSONObject();
        json.put(ID, document.getObjectId(MONGO_ID).toHexString());
        json.put(MA_KH, document.getString(MA_KH));
        json.put(TEN_KH, document.getString(TEN_KH));
        json.put(DIA_CHI, document.getString(DIA_CHI));
        json.put(MA_KHU_VUC, document.getString(MA_KHU_VUC));
        json.put(MA_DK, document.getString(MA_DK));
        json.put(CMND, document.getString(CMND));
        json.put(PHONE, document.getString(PHONE));
        json.put(GIOI_TINH, document.getString(GIOI_TINH));
        json.put(ROLE, document.getString(ROLE));
        json.put(PASSWORD, document.getString(PASSWORD));
        json.put(NGAY_SINH, document.getString(NGAY_SINH));
        return json;
    }
    public Result getAllKhachHang(){
        JSONArray array = new JSONArray();
        MongoCollection collection = db.getCollection(TABLE_KHACH_HANG);
        FindIterable<Document> iterable = collection.find();
        iterable.forEach(new Block<Document>() {
            @Override
            public void apply(Document document) {
                String diachi = UserService.createDiaChi(document.getString(DIA_CHI), document.getString(MA_KHU_VUC));
                JSONObject json = createJSON(document);
                json.put(DIA_CHI, diachi);
                array.put(json);
            }
        });
        return Results.text().render(array);
    }



    public Result getKhachHangStatistic(@Param("makv") String makv){
        JSONArray array = new JSONArray();
        MongoCollection collection = db.getCollection(TABLE_KHACH_HANG);

        FindIterable<Document> iterable = collection.find(new Document("makv", makv));
        iterable.forEach(new Block<Document>() {
            @Override
            public void apply(Document document) {
                JSONObject json = createJSON(document);
                String diachi = UserService.createDiaChi(document.getString(DIA_CHI), document.getString(MA_KHU_VUC));
                json.put(DIA_CHI, diachi);
                System.out.println(json.toString());
                array.put(json);
            }
        });
        return Results.text().render(array);
    }

    public Result deleteKhachHang(@Param("makh") String makh){
        MongoCollection collection = db.getCollection(TABLE_KHACH_HANG);
        Document document = new Document(MA_KH, makh);
        collection.deleteOne(document);
        return Results.ok();
    }

    public Result addKhachHang(@Param("makh") String makh,
                               @Param("tenkh") String tenkh,
                               @Param("diachi") String diachi,
                               @Param("makv") String makv,
                               @Param("madk") String madk,
                               @Param("cmnd") String cmnd,
                               @Param("ngaysinh") String ngaysinh,
                               @Param("phone") String phone,
                               @Param("gioitinh") String gioitinh){
        Document document = new Document()
                .append(MA_KH, makh.toUpperCase())
                .append(TEN_KH, tenkh)
                .append(DIA_CHI, diachi)
                .append(MA_KHU_VUC, makv.toUpperCase())
                .append(MA_DK, madk)
                .append(CMND, cmnd)
                .append(BIRTH_DAY, ngaysinh)
                .append(PHONE, phone)
                .append(GIOI_TINH, gioitinh)
                .append(ROLE, "customer");
        MongoCollection collection = db.getCollection(TABLE_KHACH_HANG);
        collection.insertOne(document);
        return Results.redirect("/");
    }

    public Result newPassword(@Param("makh") String makh,
                              @Param("newpass") String newpass){
        MongoCollection collection = db.getCollection(TABLE_KHACH_HANG);
        Document doc = new Document(MONGO_ID, new ObjectId(makh));
        FindIterable<Document> iter = collection.find(doc);
        iter.forEach(new Block<Document>() {
            @Override
            public void apply(Document document) {
                document.replace(PASSWORD, newpass);
            }
        });
        return Results.ok();
    }
}
