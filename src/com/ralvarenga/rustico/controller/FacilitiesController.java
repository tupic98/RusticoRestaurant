package com.ralvarenga.rustico.controller;

import java.util.List;

import javax.validation.Valid;

import org.jboss.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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

	@PostMapping("/saveFacility")
	public @ResponseBody ResponseEntity<String> saveFacility(@Valid @ModelAttribute Sucursal sucursal,
			BindingResult result) {
		if (result.hasErrors()) {
			return new ResponseEntity<String>("Error. Algun campo no tiene el formato correcto", HttpStatus.NOT_FOUND);
		}
		try {
			sucursalService.saveSucursal(sucursal);
		} catch (Exception e) {
			logger.error("No se pudo guardar sucursal", e);
			return new ResponseEntity<String>("Hubo un error al momento de guardar la sucursal", HttpStatus.NOT_FOUND);
		}
		return new ResponseEntity<String>("Sucursal guardada correctamente!", HttpStatus.CREATED);
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
			mav.setViewName("redirect:/facilities");
			return mav;
		}
		mav.addObject("facility", sucursal);
		mav.setViewName("facilityForm");
		return mav;
	}

	@PostMapping("/deleteFacility")
	public @ResponseBody ResponseEntity<String> deleteExistingFacility(@RequestParam(value = "idFacility") Long id) {
		Sucursal sucursal = new Sucursal();
		try {
			sucursal = sucursalService.getSucursalById(id);
			sucursalService.deleteSucursal(id);
		} catch (Exception e) {
			logger.error("Error deleting facility" + id, e);
			return new ResponseEntity<String>("Hubo un error al eliminar la sucursal '" + sucursal.getsNombre(),
					HttpStatus.NOT_FOUND);
		}
		return new ResponseEntity<String>("Sucursal '" + sucursal.getsNombre() + "' borrada correctamente",
				HttpStatus.OK);
	}

	@GetMapping("/facilityProfile")
	public ModelAndView facilityProfile(@RequestParam(value = "idFacility") Long id) {
		try {
			Sucursal sucursal = new Sucursal();
			List<Empleado> empleados = null;
			sucursal = sucursalService.getSucursalById(id);
			empleados = sucursal.getEmpleados();
			mav.addObject("facility", sucursal);
			mav.addObject("employees", empleados);

		} catch (Exception e) {
			logger.error("Error cargando el perfil ", e);
			mav.setViewName("redirect:/facilities");
			return mav;
		}
		mav.setViewName("facilityProfile");
		return mav;
	}

	@RequestMapping(value = "/updateEmployee", method = RequestMethod.POST)
	public ModelAndView updateEmployee(@RequestParam(value = "idFacility") Long idFacility,
			@RequestParam(value = "idEmployee") Long idEmployee) {
		try {
			Empleado empleado = new Empleado();
			empleado = empleadoService.findEmployeeById(idEmployee);
			mav.addObject("employee", empleado);
			mav.addObject("idFacility", idFacility);
		} catch (Exception e) {
			logger.error("Error encontrando empleado", e);
			return facilityProfile(idFacility);
		}
		mav.setViewName("employeeForm");
		return mav;
	}

	@PostMapping("/saveEmployee")
	public @ResponseBody ResponseEntity<String> saveEmployee(@Valid @ModelAttribute Empleado empleado,
			BindingResult result, @RequestParam(value = "idFacility") Long idFacility) {
		if (result.hasErrors()) {
			return new ResponseEntity<String>("Error. Algún campo no tiene el formato correcto", HttpStatus.NOT_FOUND);
		}
		Sucursal sucursal = new Sucursal();
		try {
			sucursal = sucursalService.getSucursalById(idFacility);
			empleado.seteSucursal(sucursal);
			empleadoService.saveEmployee(empleado);
		} catch (Exception e) {
			logger.error("Error guardando datos del empleado", e);
			return new ResponseEntity<String>("Error. No se pudo guardar empleado", HttpStatus.NOT_FOUND);
		}
		return new ResponseEntity<String>("Empleado guardado correctamente", HttpStatus.OK);
	}

	@PostMapping("/deleteEmployee")
	public @ResponseBody ResponseEntity<String> deleteEmployee(@RequestParam(value = "idFacility") Long idFacility,
			@RequestParam(value = "idEmployee") Long idEmployee) {
		Empleado empleado = new Empleado();
		try {
			empleado = empleadoService.findEmployeeById(idEmployee);
			empleadoService.deleteEmployee(idEmployee);
		} catch (Exception e) {
			logger.error("Error bo", e);
			return new ResponseEntity<String>("No se pudo eleminar el empleado '" + empleado.geteNombre(),
					HttpStatus.NOT_FOUND);
		}
		return new ResponseEntity<String>("Empleado '" + empleado.geteNombre() + "' se ha eliminado correctamente",
				HttpStatus.OK);
	}

	@PostMapping("/addEmployee")
	public ModelAndView addEmployee(@RequestParam(value = "idFacility") Long idFacility) {
		mav.addObject("employee", new Empleado());
		mav.addObject("idFacility", idFacility);
		mav.setViewName("employeeForm");
		return mav;
	}
}
