% MEHMET ALTINTAS 1901022065
% ELEKTOMANYETİK ALAN TEORİSİ PROJE
% ==========================================================
% Dairesel disk (yarıçap a, yüzeysel yük yoğunluğu rho_s)
% herhangi bir P(x,y,z) noktasında oluşturduğu potansiyelin
% nümerik hesaplanması (Coulomb integrali).
% ==========================================================

clear; clc;

% -- Fiziksel sabitler & Parametreler --
eps0  = 8.8541878128e-12;  % Boşluk dielektrik sabiti (F/m)
rho_s = -3;                % Yüzeysel yük yoğunluğu (C/m^2)
a     = 2;                 % Disk yarıçapı (m)

% -- POTANSİYELİN HESAPLANACAĞI NOKTA (P) KOORDİNATLARI --
xP = input('P(m) noktasının x-koordinatını girin : ');
yP = input('P(m) noktasının y-koordinatını girin : ');
zP = input('P(m) noktasının z-koordinatını girin : ');

% ==========================================================
% İntegralin tanımı (polar koordinatlar):
%   r: 0 --> a
%   phi: 0 --> 2*pi
%
% Disk üzerindeki bir eleman: (r*cos(phi), r*sin(phi), 0).
% P noktasına uzaklık: R = sqrt( (xP - r*cos(phi))^2
%                                 + (yP - r*sin(phi))^2
%                                 + zP^2 )
% dS = r * dr * dphi
%
% İntegrand = (rho_s / (4*pi*eps0)) * (1 / R) * r
% ==========================================================

fIntegrand = @(phi,r) ...
    ( rho_s / (4*pi*eps0) ) .* ...
    ( r ./ sqrt( (xP - r.*cos(phi)).^2 ...
               + (yP - r.*sin(phi)).^2 ...
               + zP^2 ) );

% Çifte integralin (phi=0..2*pi, r=0..a) numerik hesabı:
V = integral2( fIntegrand, 0, 2*pi, 0, a );

% -- SONUCU YAZDIR --
fprintf('Diskin P(%.2f, %.2f, %.2f) noktasinda olusturdugu potansiyel = %g V\n',...
        xP, yP, zP, V);
