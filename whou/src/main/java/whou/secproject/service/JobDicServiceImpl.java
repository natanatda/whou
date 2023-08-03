package whou.secproject.service;


import java.util.List; 

import org.springframework.beans.factory.annotation.Autowired; 
import org.springframework.stereotype.Service;

import whou.secproject.component.JobDicAptdValueListDTO;
import whou.secproject.component.JobDicDetailResponseDTO;
import whou.secproject.component.JobDicValueListDTO;
import whou.secproject.component.JobInsertDTO;
import whou.secproject.component.Job_infoDTO;
import whou.secproject.component.Job_unique_numDTO;
import whou.secproject.mapper.JobDicMapper;

@Service
public class JobDicServiceImpl implements JobDicService {

	@Autowired
	private JobDicMapper mapper;
	
	@Override
	public List<JobDicValueListDTO> getSortValue(String tb_name){
		return mapper.getSortValue(tb_name);
	}
	@Override
	public List<JobDicAptdValueListDTO> getAptdValue(String tb_name){
		return mapper.getAptdValue(tb_name);
	}
	@Override
	public List<Job_unique_numDTO> getJobNum(String tb_name) {
		return mapper.getJobNum(tb_name);
	}
	@Override
	public void insert(JobDicDetailResponseDTO dto) {
		Job_infoDTO jidto = new Job_infoDTO();
		
//		StringBuilder sb = new StringBuilder();
//		List<JobDicDetailResponseDTO.Work> workList = dto.getWorkList();
//		List<JobDicDetailResponseDTO.Interest> interestList = dto.getInterestList();
//		List<JobDicDetailResponseDTO.Research> researchList = dto.getResearchList();
//		JobDicDetailResponseDTO.JobReady jobReadyList = dto.getJobReady();
//		JobDicDetailResponseDTO.Perform performList = dto.getPerform();

		JobDicDetailResponseDTO.BaseInfo bi= dto.getBaseInfo();
//		if(workList.get(0)!=null) {
//			for (int i = 0; i < workList.size(); i++) {
//				if (i > 0) sb.append("/");
//				sb.append(workList.get(i).getWork());
//			}
//			jidto.setWorks(sb.toString());
//			sb.setLength(0);
//		}
//		
//		if(interestList.get(0)!=null) {
//			for (int i = 0; i < interestList.size(); i++) {
//				if (i > 0) sb.append("/");
//				sb.append(interestList.get(i).getInterest());
//			}
//			jidto.setInterests(sb.toString());
//			sb.setLength(0);
//		}
//		if(researchList.size()!=0)
//			if(researchList.get(0)!=null) {
//				for (int i = 0; i < researchList.size(); i++) {
//					if (i > 0) sb.append("/");
//					sb.append(researchList.get(i).getResearch());
//				}
//			}
//		jidto.setResearchs(sb.toString());
//		jidto.setAptit_name(bi.getAptit_name());
//		jidto.setEmp_job_nm(bi.getEmp_job_nm());
//		
//		if(bi.getSocial()!=null) jidto.setSocial(bi.getSocial());
//		else jidto.setSocial("");
//		
//		jidto.setEmp_job_cd(bi.getEmp_job_cd());
		
		int job_cd = bi.getJob_cd();
		jidto.setJob_cd(job_cd);
//		jidto.setSatisfication(bi.getSatisfication());
//		
//		if(bi.getRel_job_nm()!=null) jidto.setRel_job_nm(bi.getRel_job_nm());
//		else jidto.setRel_job_nm("");
//	 
//		jidto.setJob_nm(bi.getJob_nm());
//		jidto.setStd_job_nm(bi.getStd_job_nm());
//		
//		if(bi.getWlb()!=null) jidto.setWlb(bi.getWlb());
//		else jidto.setWlb("");
//		
//		jidto.setStd_job_cd(bi.getStd_job_cd());
//		
//		if(bi.getWage_source()!=null) jidto.setWage_source(bi.getWage_source());
//		else jidto.setWage_source("");
//		
//		jidto.setEdit_dt(bi.getEdit_dt());
//		jidto.setReg_dt(bi.getEdit_dt());
//		if(bi.getSatisfi_source()!=null) jidto.setSatisfi_source(bi.getSatisfi_source());
//		else jidto.setSatisfi_source("");
//		jidto.setSeq(bi.getSeq());
//		jidto.setViews(bi.getViews());
//		jidto.setLikes(bi.getLikes());
//		if(bi.getWage()!=null) jidto.setWage(bi.getWage());
//		else jidto.setWage("");
//		
//		mapper.insertJI(jidto);
		
		//////////////////////////////////////////
		
		JobInsertDTO jindto = new JobInsertDTO();
		
//		jindto.setNum(job_cd);
//		jindto.setTb_name("ready");
//		
//		for(JobDicDetailResponseDTO.Recruit jr : jobReadyList.getRecruit()) {
//			if(jr.getRecruit()!=null) {
//				jindto.setFactor("recruit");
//				jindto.setValue(jr.getRecruit());
//				mapper.insertJR(jindto);
//			}
//		}
//		for(JobDicDetailResponseDTO.Certificate jc : jobReadyList.getCertificate()) {
//			if(jc!=null)
//				if(jc.getCertificate()!=null) {
//					jindto.setFactor("certificate");
//					jindto.setValue(jc.getCertificate());
//					mapper.insertJR(jindto);
//				}
//		}
//		for(JobDicDetailResponseDTO.Training jt : jobReadyList.getTraining()) {
//			if(jt!=null)
//			if(jt.getTraining()!=null) {
//				jindto.setFactor("training");
//				jindto.setValue(jt.getTraining());
//				mapper.insertJR(jindto);
//			}
//		}
//		for(JobDicDetailResponseDTO.Curriculum jc : jobReadyList.getCurriculum()) {
//			if(jc!=null)
//			if(jc.getCurriculum()!=null) {
//				jindto.setFactor("curriculum");
//				jindto.setValue(jc.getCurriculum());
//				mapper.insertJR(jindto);
//			}
//		}
//		
//		jindto.setTb_name("perform");
//		jindto.setFactor("environment");
//		if(performList.getEnvironment()!=null) 
//			if(performList.getEnvironment().size()!=0)
//				for(JobDicDetailResponseDTO.Environment je : performList.getEnvironment()) {
//					if(je!=null) {
//						if(je.getEnvironment()!=null)jindto.setFactor_value(je.getEnvironment());
//						else jindto.setFactor_value("");
//						
//						if(je.getInform()!=null)jindto.setInform(je.getInform());
//						else jindto.setInform("");
//						
//						jindto.setImportance(je.getImportance());
//						
//						if(je.getSource()!=null)jindto.setSource(je.getSource());
//						else jindto.setSource("");
//		
//						mapper.insertJP(jindto);
//					}
//				}
//		jindto.setFactor("perform");
//		if(performList.getPerform_()!=null) 
//			if(performList.getPerform_().size()!=0)
//				for(JobDicDetailResponseDTO.Perform_ jp : performList.getPerform_()) {
//					if(jp!=null) {
//						if(jp.getPerform()!=null)jindto.setFactor_value(jp.getPerform());
//						else jindto.setFactor_value("");
//						
//						if(jp.getInform()!=null)jindto.setInform(jp.getInform());
//						else jindto.setInform("");
//						
//						jindto.setImportance(jp.getImportance());
//						
//						if(jp.getSource()!=null)jindto.setSource(jp.getSource());
//						else jindto.setSource("");
//						
//						mapper.insertJP(jindto);
//					}
//				}
//		jindto.setFactor("knowledge");
//		if(performList.getKnowledge()!=null)
//			if(performList.getKnowledge().size()!=0)
//				for(JobDicDetailResponseDTO.Knowledge jk : performList.getKnowledge()) {
//					if(jk!=null) {
//						if(jk.getKnowledge()!=null)jindto.setFactor_value(jk.getKnowledge());
//						else jindto.setFactor_value("");
//		
//						if(jk.getInform()!=null)jindto.setInform(jk.getInform());
//						else jindto.setInform("");
//						
//						jindto.setImportance(jk.getImportance());
//						
//						if(jk.getSource()!=null)jindto.setSource(jk.getSource());
//						else jindto.setSource("");
//						mapper.insertJP(jindto);
//					}
//				}
//		
		List<JobDicDetailResponseDTO.Forecast> foreList= dto.getForecast();
		List<JobDicDetailResponseDTO.EduChart> eduChList= dto.getEduChart();
		List<JobDicDetailResponseDTO.MajorChart> maChList= dto.getMajorChart();
		List<JobDicDetailResponseDTO.Ability> abList= dto.getAbilityList();
		List<JobDicDetailResponseDTO.Depart> dpList= dto.getDepartList();
		List<JobDicDetailResponseDTO.Certi> certiList= dto.getCertiList();
		List<JobDicDetailResponseDTO.Aptitude> aptiList= dto.getAptitudeList();
		List<JobDicDetailResponseDTO.IndicatorChart> idchList= dto.getIndicatorChart();
		jindto.setNum(job_cd);
		jindto.setFactor("forecast");
		jindto.setFactor_value("forecast");
		if(foreList!=null) 
			if(foreList.size()!=0)
				for(JobDicDetailResponseDTO.Forecast jf : foreList) {
					if(jf!=null) {
						if(jf.getForecast()!=null)jindto.setValue(jf.getForecast());
						else jindto.setValue("");
						
						mapper.insertJD(jindto);
					}
				}
		jindto.setFactor("educhart");
		if(eduChList!=null) 
			if(eduChList.size()!=0)
				for(JobDicDetailResponseDTO.EduChart je : eduChList) {
					if(je!=null) {
						jindto.setFactor_value("chart_name");
						if(je.getChart_name()!=null) {
							jindto.setValue(je.getChart_name());
							mapper.insertJD(jindto);
						}
						jindto.setFactor_value("chart_data");
						if(je.getChart_data()!=null) {
							jindto.setValue(je.getChart_data());
							mapper.insertJD(jindto);
						}
						jindto.setFactor_value("source");
						if(je.getSource()!=null) {
							jindto.setValue(je.getSource());
							mapper.insertJD(jindto);
						}
					}
				}
		jindto.setFactor("major");
		if(maChList!=null) 
			if(maChList.size()!=0)
				for(JobDicDetailResponseDTO.MajorChart ma : maChList) {
					if(ma!=null) {
						jindto.setFactor_value("major");
						if(ma.getMajor()!=null) {
							jindto.setValue(ma.getMajor());
							mapper.insertJD(jindto);
						}
						jindto.setFactor_value("major_data");
						if(ma.getMajor_data()!=null) {
							jindto.setValue(ma.getMajor_data());
							mapper.insertJD(jindto);
						}
						jindto.setFactor_value("source");
						if(ma.getSource()!=null) {
							jindto.setValue(ma.getSource());
							mapper.insertJD(jindto);
						}
					}
				}
		jindto.setFactor("depart");
		if(dpList!=null) 
			if(dpList.size()!=0)
				for(JobDicDetailResponseDTO.Depart dp : dpList) {
					if(dp!=null) {
						jindto.setFactor_value("depart_id");
						if(dp.getDepart_id()!=null) {
							jindto.setValue(dp.getDepart_id());
							mapper.insertJD(jindto);
						}
						jindto.setFactor_value("depart_name");
						if(dp.getDepart_name()!=null) {
							jindto.setValue(dp.getDepart_name());
							mapper.insertJD(jindto);
						}
					}
				}
		jindto.setFactor("ability");
		if(abList!=null) 
			if(abList.size()!=0)
				for(JobDicDetailResponseDTO.Ability ab: abList) {
					if(ab!=null) {
						jindto.setFactor_value("sort_ordr");
						if(ab.getSORT_ORDR()!=null) {
							jindto.setValue(ab.getSORT_ORDR());
							mapper.insertJD(jindto);
						}
						jindto.setFactor_value("ability_name");
						if(ab.getAbility_name()!=null) {
							jindto.setValue(ab.getAbility_name());
							mapper.insertJD(jindto);
						}
					}
				}
		
		jindto.setFactor("certi");
		if(certiList!=null) 
			if(certiList.size()!=0)
				for(JobDicDetailResponseDTO.Certi certi: certiList) {
					if(certi!=null) {
						jindto.setFactor_value("certi");
						if(certi.getCerti()!=null) {
							jindto.setValue(certi.getCerti());
							mapper.insertJD(jindto);
						}
						jindto.setFactor_value("link");
						if(certi.getLink()!=null) {
							jindto.setValue(certi.getLink());
							mapper.insertJD(jindto);
						}
					}
				}
		jindto.setFactor("aptitude");
		jindto.setFactor_value("aptitude");
		if(aptiList!=null) 
			if(aptiList.size()!=0)
				for(JobDicDetailResponseDTO.Aptitude at: aptiList) {
					if(at!=null) {
						if(at.getAptitude()!=null)jindto.setValue(at.getAptitude());
						else jindto.setValue("");
						
						mapper.insertJD(jindto);
					}
				}
		if(idchList!=null) 
			if(idchList.size()!=0)
				for(JobDicDetailResponseDTO.IndicatorChart id : idchList) {
					if(id!=null) {
						jindto.setFactor_value("indicator");
						if(id.getIndicator()!=null) {
							jindto.setValue(id.getIndicator());
							mapper.insertJD(jindto);
						}
						jindto.setFactor_value("indicator_data");
						if(id.getIndicator_data()!=null) {
							jindto.setValue(id.getIndicator_data());
							mapper.insertJD(jindto);
						}
						jindto.setFactor_value("source");
						if(id.getSource()!=null) {
							jindto.setValue(id.getSource());
							mapper.insertJD(jindto);
						}
					}
				}
	}
	@Override
	public void insertJCC(int sort_value, String job_cds) {
		mapper.insertJCC(sort_value, job_cds);
	}
	@Override
	public String getBackColor(int j_cd) {
		List<String> backColor;
		if((backColor=mapper.getBackColor(j_cd))!=null&&backColor.size()!=0)
			return backColor.get(0);
		else {
			return "5a3fff";
		}
	}
	@Override
	public String getImg(int j_cd) {
		return mapper.getImg(j_cd);
	}
}

