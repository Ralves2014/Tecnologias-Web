package com.roytuts.spring.boot.security.form.based.jdbc.userdetailsservice.auth.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import javax.sql.DataSource;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    @Autowired
    private DataSource dataSource;

    @Autowired
    public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
        final String sqlUserName = "select u.user_name, u.user_pass, u.enable from my_user u where u.user_name = ?";
        final String sqlAuthorities = "select ur.user_name, ur.user_role from my_user_role ur where ur.user_name = ?";
        auth.jdbcAuthentication().dataSource(dataSource).usersByUsernameQuery(sqlUserName)
                .authoritiesByUsernameQuery(sqlAuthorities).passwordEncoder(passwordEncoder());
        //auth.userDetailsService(userAuthService).passwordEncoder(passwordEncoder());
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http
                .authorizeRequests()
                .antMatchers("/admin").hasRole("ADMIN")
                .antMatchers("/", "/index", "/anuncio_detalhes_offers",
                        "/anuncio_detalhes_searches", "/procurar", "/anuncios",
                        "/anuncio_detalhes", "/static/**", "/login", "/newuser",
                        "/register","/roomsearchoferta","/roomsearchprocura","/anuncio",
                        "/gereanuncios","/registarprocura","/registaroferta","/controloanuncio",
                        "/mensagens", "/contactar").permitAll().anyRequest().authenticated()
                .and()
                .formLogin()
                .loginPage("/login")
                .loginProcessingUrl("/j_spring_security_check")
		.defaultSuccessUrl("/")
                .permitAll()
                .and()
                .logout()
                .permitAll();
        http.cors().and().csrf().disable();
    }

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }
}
