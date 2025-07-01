% Fonction pour faire une rotation d'une image ou matrice
function img_rot = rotation_image(img, angle)
    % img: Matrice d'entrée
    % angle: Angle de rotation en degrés

    % Conversion de l'angle de rotation de degrés en radians car 
    % les fonctions trigonométriques de MATLAB utilisent les radians
    theta = deg2rad(angle);

    % Obtenir la taille de l'image (n = nombre de lignes, 
    % m = nombre de colonnes, k = nombre de canaux)
    [n, m, k] = size(img);  % k = 1 pour une image en niveaux de gris, k = 3 pour une image couleur (RGB)

    % Calculer le centre de l'image
    cx = (n + 1) / 2;  % Coordonnée x du centre
    cy = (m + 1) / 2;  % Coordonnée y du centre
    new_n = ceil(sqrt(n^2 + m^2));  % Taille après rotation
    new_m = ceil(sqrt(n^2 + m^2));  % Taille après rotation

    % Gestion des cas particuliers pour 0, 90, 180, et 270 degrés
    if mod(angle, 360) == 0 || mod(angle, 360) == 180
        new_n = n;
        new_m = m;
    elseif mod(angle, 360) == 90 || mod(angle, 360) == 270
        new_n = m;
        new_m = n;
    end

    % Calculer le centre de la nouvelle image
    new_cx = (new_n + 1) / 2;
    new_cy = (new_m + 1) / 2;

    % Créer une nouvelle matrice vide pour stocker l'image tournée
    img_rot = zeros(new_n, new_m, k);

    % Parcourir chaque pixel de l'image d'origine
    for i = 1:n
        for j = 1:m
            % On calcule les coordonnées du pixel par rapport au centre de l'image
            x = i - cx;  % Distance horizontale par rapport au centre
            y = j - cy;  % Distance verticale par rapport au centre

            % Appliquer la transformation de rotation
            x1 = x * cos(theta) - y * sin(theta);
            y1 = x * sin(theta) + y * cos(theta);

            % Revenir aux coordonnées dans la nouvelle image
            i1 = round(x1 + new_cx);  % Ajuster la nouvelle position x
            j1 = round(y1 + new_cy);  % Ajuster la nouvelle position y

            % Vérifier que les nouvelles coordonnées (i1, j1) sont valides
            if i1 > 0 && j1 > 0 && i1 <= new_n && j1 <= new_m
                % Copier la valeur du pixel d'origine à la nouvelle position
                img_rot(i1, j1, :) = img(i, j, :);
            end
        end
    end
    img_rot = uint8(img_rot);
end
