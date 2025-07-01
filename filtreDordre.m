function A1 = filtreDordre(A, c, o)
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
            A1(:, :, can) = appliquerFiltreDordre(Ac, c, o);
        end
    else
        % Pour une image en niveaux de gris
        Ac = vpadding(A, c);
        A1 = appliquerFiltreDordre(Ac, c, o);
    end
end

function A_filtre = appliquerFiltreDordre(img_pad, c, o)
    % Fonction interne pour appliquer le filtre médian sur une image paddée.
    [n, m] = size(img_pad);
    k = fix(c / 2); % Moitié de la taille de la fenêtre
    A_filtre = zeros(n - 2 * k, m - 2 * k, 'uint8'); % Initialisation
    if o<0 || o>c^2
        output("erreur...");
    else
        % Parcours de l'image paddée
        for i = k + 1:n - k
            for j = k + 1:m - k
                % Extraction de la fenêtre locale
                h = img_pad(i - k:i + k, j - k:j + k);
                h = Trie(h);
                % Sélection de la valeur correspondant à l'ordre
                A_filtre(i - k, j - k) = h(o);
            end
        end
    end
end
