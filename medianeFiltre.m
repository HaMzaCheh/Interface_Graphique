function A1 = medianeFiltre(A, c)
    % Obtenir les dimensions de l'image
    [li, co, w] = size(A);

    % Initialisation de l'image filtrée
    A1 = uint8(zeros(li, co, w));

    % Si l'image est RGB (3 canaux), appliquer le filtre sur chaque canal
    if w == 3
        for can = 1:w
            % Padding pour gérer les bords
            Ac = vpadding(A(:, :, can), c);
            % Application du filtre médian sur ce canal
            A1(:, :, can) = appliquerFiltreMediane(Ac, c);
        end
    else
        % Pour une image en niveaux de gris
        Ac = vpadding(A, c);
        A1 = appliquerFiltreMediane(Ac, c);
    end
end

function A_filtre = appliquerFiltreMediane(img_pad, c)
    % Fonction interne pour appliquer le filtre médian sur une image paddée.
    [n, m] = size(img_pad);
    k = fix(c / 2); % Moitié de la taille de la fenêtre
    A_filtre = zeros(n - 2 * k, m - 2 * k, 'uint8'); % Initialisation

    % Parcours de l'image paddée
    for i = k + 1:n - k
        for j = k + 1:m - k
            % Extraction de la fenêtre locale
            h = img_pad(i - k:i + k, j - k:j + k);
            % Calcul de la médiane
            A_filtre(i - k, j - k) = median(h(:));
        end
    end
end
