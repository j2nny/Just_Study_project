package admin_p;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import event_p.EventService;
import model_p.EventDAO;
import model_p.EventDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

public class AdminEventModifyReg implements AdminService{
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

        String path = request.getRealPath("/img/event");
      /*  path = "/Users/song-chanwook/workplace/git_repo/ JustStudy/Just_Study_project/JustStudy/src/main/webapp/img/event";
        path = "C:\\Users\\dieun\\jieun\\coding\\GItHub\\Just_Study_project\\JustStudy\\src\\main\\webapp\\img\\event";*/

//        path = "C:\\Users\\whgml\\juststudy_git\\JustStudy\\src\\main\\webapp\\" +
//                "\\img\\event";

//        path = "C:\\juststudy\\JustStudy\\src\\main\\webapp\\img\\event";

        int size = 1024 * 1024 * 10;

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

        EventDTO dto = new EventDTO();


        try {

            MultipartRequest mr = new MultipartRequest(request, path, size, "UTF-8", new DefaultFileRenamePolicy());

            dto.setTitle(mr.getParameter("title"));
            if(mr.getFilesystemName("content") == null){
                dto.setContent(mr.getParameter("content"));
            }else{
                dto.setContent(mr.getFilesystemName("content"));
            }
            if(mr.getFilesystemName("img") == null){
                dto.setImg(mr.getParameter("img"));
            }else{
                dto.setImg(mr.getFilesystemName("img"));
            }

            dto.setEvent_startdate(sdf.parse(mr.getParameter("event_startdate")));
            dto.setEvent_enddate(sdf.parse(mr.getParameter("event_enddate")));
            dto.setId(Integer.parseInt(mr.getParameter("id")));

            String msg = "수정 실패";
            String adminUrl = "adminEventModifyForm.jsp";

            if(new EventDAO().modify(dto, mr.getFilesystemName("img") ) > 0){

                msg = "수정되었습니다.";
                adminUrl = "alert.jsp";
            }

            request.setAttribute("msg", msg);
            request.setAttribute("adminUrl", adminUrl);

            request.setAttribute("goUrl", "AdminEventDetail?id="+dto.getId());
            request.setAttribute("EventDTO", dto);

        } catch (IOException e) {
            throw new RuntimeException(e);
        } catch (ParseException e) {
            throw new RuntimeException(e);
        }




    }
}
