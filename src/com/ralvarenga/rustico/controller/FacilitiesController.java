package com.ralvarenga.rustico.controller;

import java.util.List;

import org.jboss.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ralvarenga.rustico.domain.Empleado;
import com.ralvarenga.rustico.domain.Sucursal;
import com.ralvarenga.rustico.service.EmpleadoService;
import com.ralvarenga.rustico.service.SucursalService;

@Controller
public class FacilitiesController {
	static Logger logger = Logger.getLogger(FacilitiesController.class.getName());

	ModelAndView mav = new ModelAndView();

	@Autowired
	SucursalService sucursalService;

	@Autowired
	EmpleadoService empleadoService;

	@RequestMapping("/facilities")
	public ModelAndView facilities() {
		List<Sucursal> facilities = null;
		String facilitiesErrorMessage = "Couldn't get facilities list";

		try {
			facilities = sucursalService.getAllSucursales();
			mav.addObject("facilitiesErrorMessage", null);
		} catch (Exception e) {
			logger.error(facilitiesErrorMessage, e);
			mav.addObject("facilitiesErrorMessage", facilitiesErrorMessage);
		}
		mav.addObject("facilities", facilities);
		mav.setViewName("facilities");
		return mav;
	}

	@RequestMapping(value = "/createFacility", method = RequestMethod.POST)
	public ModelAndView createFacility() {
		mav.addObject("facility", new Sucursal());
		mav.setViewName("facilityForm");
		return mav;
	}

	@RequestMapping("/saveFacility")
	public ModelAndView saveFacility(@ModelAttribute Sucursal sucursal) {
		String saveFacilityErrorMessage = "Couldn't save facility";
		String saveFacilitySuccessMessage = "Facility saved!";
		try {
			sucursalService.saveSucursal(sucursal);
			mav.addObject("saveFacilityErrorMessage", null);
			mav.addObject("saveFacilitySuccessMessage", saveFacilitySuccessMessage);
		} catch (Exception e) {
			mav.addObject("saveFacilitySuccessMessage", null);
			logger.error(saveFacilityErrorMessage, e);
			mav.addObject("saveFacilityErrorMessage", saveFacilityErrorMessage);
		}
		return facilities();
	}

	@RequestMapping(value = "/updateFacility", method = RequestMethod.POST)
	public ModelAndView updateExistingFacility(@RequestParam(value = "idFacility") Long id) {
		Sucursal sucursal = new Sucursal();
		String updateFacilityErrorMessage = "An error ocurred obtaining the facility to update";
		try {
			sucursal = sucursalService.getSucursalById(id);
			mav.addObject("updateFacilityErrorMessage", null);
		} catch (Exception e) {
			logger.error(updateFacilityErrorMessage, e);
			mav.addObject("updateFacilityErrorMessage", updateFacilityErrorMessage);
			return facilities();
		}
		mav.addObject("facility", sucursal);
		mav.setViewName("facilityForm");
		return mav;
	}

	@RequestMapping(value = "/deleteFacility", method = RequestMethod.POST)
	public ModelAndView deleteExistingFacility(@RequestParam(value = "idFacility") Long id) {
		String errorMessage = "An error ocurred trying to delete the facility";
		try {
			Sucursal sucursal = new Sucursal();
			sucursal = sucursalService.getSucursalById(id);
			sucursalService.deleteSucursal(id);
			mav.addObject("deleteFacilityErrorMessage", null);
			mav.addObject("deleteFacilitySuccessMessage",
					"Facility " + sucursal.getsNombre() + " has been deleted correctly");
		} catch (Exception e) {
			mav.addObject("deleteFacilitySuccessMessage", null);
			logger.error(errorMessage, e);
			mav.addObject("deleteFacilityErrorMessage", errorMessage);
		}
		return facilities();
	}

	@RequestMapping(value = "/facilityProfile", method = RequestMethod.GET)
	public ModelAndView facilityProfile(@RequestParam(value = "idFacility") Long id) {
		String facilityProfileErrorMessage = "An error ocurred trying to load the facility profile";
		try {
			Sucursal sucursal = new Sucursal();
			List<Empleado> empleados = null;
			sucursal = sucursalService.getSucursalById(id);
			empleados = sucursal.getEmpleados();
			mav.addObject("facilityProfileErrorMessage", null);
			mav.addObject("facility", sucursal);
			mav.addObject("employees", empleados);

		} catch (Exception e) {
			logger.error(facilityProfileErrorMessage, e);
			mav.addObject("facilityProfileErrorMessage", facilityProfileErrorMessage);
			return facilities();
		}
		mav.setViewName("facilityProfile");
		return mav;
	}

	@RequestMapping(value = "/updateEmployee", method = RequestMethod.POST)
	public ModelAndView updateEmployee(@RequestParam(value = "idFacility") Long idFacility,
			@RequestParam(value = "idEmployee") Long idEmployee) {
		String updateEmployeeErrorMessage = "An error ocurred obtaining the employee to update";
		try {
			mav.addObject("updateEmployeeErrorMessage", null);
			Empleado empleado = new Empleado();
			empleado = empleadoService.findEmployeeById(idEmployee);
			mav.addObject("employee", empleado);
			mav.addObject("idFacility", idFacility);
		} catch (Exception e) {
			logger.error(updateEmployeeErrorMessage, e);
			mav.addObject("updateEmployeeErrorMessage", updateEmployeeErrorMessage);
			return facilityProfile(idFacility);
		}
		mav.setViewName("employeeForm");
		return mav;
	}

	@RequestMapping(value = "/saveEmployee", method = RequestMethod.POST)
	public ModelAndView saveEmployee(@ModelAttribute Empleado empleado,
			@RequestParam(value = "idFacility") Long idFacility) {
		String saveEmployeeErrorMessage = "Couldn't save employee";
		String saveEmployeeSuccessMessage = "Employee saved!";
		try {
			Sucursal sucursal = new Sucursal();
			sucursal = sucursalService.getSucursalById(idFacility);
			empleado.seteSucursal(sucursal);
			empleadoService.saveEmployee(empleado);
			mav.addObject("saveEmployeeErrorMessage", null);
			mav.addObject("saveEmployeeSuccessMessage", saveEmployeeSuccessMessage);
		} catch (Exception e) {
			logger.error(saveEmployeeErrorMessage, e);
			mav.addObject("saveEmployeeSuccessMessage", null);
			mav.addObject("saveEmployeeErrorMessage", saveEmployeeErrorMessage);
		}
		return facilityProfile(idFacility);
	}

	@RequestMapping(value = "/deleteEmployee", method = RequestMethod.GET)
	public ModelAndView deleteEmployee(@RequestParam(value = "idFacility") Long idFacility,
			@RequestParam(value = "idEmployee") Long idEmployee) {
		String deleteEmployeeErrorMessage = "Couldn't delete employee";
		try {
			Empleado empleado = new Empleado();
			empleado = empleadoService.findEmployeeById(idEmployee);
			mav.addObject("deleteEmployeeSuccessMessage",
					"Employee" + empleado.geteNombre() + "has been deleted correctly");
			mav.addObject("deleteEmployeeErrorMessage", null);
			empleadoService.deleteEmployee(idEmployee);
		} catch (Exception e) {
			logger.error(deleteEmployeeErrorMessage, e);
			mav.addObject("deleteEmployeeSuccessMessage", null);
			mav.addObject("deleteEmployeeErrorMessage", deleteEmployeeErrorMessage);
		}
		return facilityProfile(idFacility);
	}

	@PostMapping("/addEmployee")
	public ModelAndView addEmployee(@RequestParam(value = "idFacility") Long idFacility) {
		mav.addObject("employee", new Empleado());
		mav.addObject("idFacility", idFacility);
		mav.setViewName("employeeForm");
		return mav;
	}
}
