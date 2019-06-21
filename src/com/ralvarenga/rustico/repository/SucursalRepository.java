package com.ralvarenga.rustico.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.ralvarenga.rustico.domain.Sucursal;

@Repository
public interface SucursalRepository extends JpaRepository<Sucursal, Long> {

}
