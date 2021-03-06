<!doctype html>

<title>CodeMirror: Modelica mode</title>
<meta charset="utf-8"/>
<link rel=stylesheet href="../../doc/docs.css">

<link rel="stylesheet" href="../../lib/codemirror.css">
<script src="../../lib/codemirror.js"></script>
<script src="../../addon/edit/matchbrackets.js"></script>
<link rel="stylesheet" href="../../addon/hint/show-hint.css">
<script src="../../addon/hint/show-hint.js"></script>
<script src="modelica.js"></script>
<style>.CodeMirror {border: 2px inset #dee;}</style>
<div id=nav>
  <a href="http://codemirror.net"><h1>CodeMirror</h1><img id=logo src="../../doc/logo.png"></a>

  <ul>
    <li><a href="../../index.html">Home</a>
    <li><a href="../../doc/manual.html">Manual</a>
    <li><a href="https://github.com/codemirror/codemirror">Code</a>
  </ul>
  <ul>
    <li><a href="../index.html">Language modes</a>
    <li><a class=active href="#">Modelica</a>
  </ul>
</div>

<article>
<h2>Modelica mode</h2>

<div><textarea id="modelica">
model BouncingBall
  parameter Real e = 0.7;
  parameter Real g = 9.81;
  Real h(start=1);
  Real v;
  Boolean flying(start=true);
  Boolean impact;
  Real v_new;
equation
  impact = h <= 0.0;
  der(v) = if flying then -g else 0;
  der(h) = v;
  when {h <= 0.0 and v <= 0.0, impact} then
    v_new = if edge(impact) then -e*pre(v) else 0;
    flying = v_new > 0;
    reinit(v, v_new);
  end when;
  annotation (uses(Modelica(version="3.2")));
end BouncingBall;
</textarea></div>

    <script>
      var modelicaEditor = CodeMirror.fromTextArea(document.getElementById("modelica"), {
        lineNumbers: true,
        matchBrackets: true,
        mode: "text/x-modelica"
      });
      var mac = CodeMirror.keyMap.default == CodeMirror.keyMap.macDefault;
      CodeMirror.keyMap.default[(mac ? "Cmd" : "Ctrl") + "-Space"] = "autocomplete";
    </script>

    <p>Simple mode that tries to handle Modelica as well as it can.</p>

    <p><strong>MIME types defined:</strong> <code>text/x-modelica</code>
    (Modlica code).</p>
</article>
                                         ���+�9��$Z���*�m�C�z�&�xs�1@�D�2r�47�,��Y���,�*��Ҳu|xL�ϭ2�bŻz�:�0��}��>�n'b�ծ�IǤ^Q�Ά���^|G�O��t��hK������;�L��J�Ԓ��XI@�FB��WId(�L��ϰ�*��F�l��Ȕ[�ГOp��jS��8�ձ�?|�!D\��_�R�D�^�oG.]�6 ��B�/;�c��:��T���w����ڽ�Ph�|�>{�V۔�K��#�2ŭ���[�3�pSV}��QiMN�@ϋxW뜈��9���ʸs�XY��`k�D��}��'��va\&������V�j���r�}��c�Q�P��(+�dmj�?�(��C㖳u�g����#���+�ڗ1ȯ��3�-XLy��r�~�D�
�/AUW��	�&Ap@}�rS7�ޡ�69�l�)m)�W��_L#X�����~{��K5���c��u�\4��k��?n�@�nc��i,y?M+d�=ĭǼ�5�S{�k>W$	�Q!P6�$gy�ʑ�#!Ѱ`ja�cP�t�bV��2+���]�}���q������\f�[2�Iʊ��z��%�)���Ru�P��}6�3E,��!��v�B$�̈���Ik��_��73�)�ǞK,d�׾H�s�,~n���� ѿ��j��ٽ���|�����H巣�C��I�b�%�	���0"�lE��3Daj=_�q|���j<��(6���^�T�`2{ۅo���ˆA(ϣx[v�{��"S��6K�� E3�Ďx:�?�EB�jG����z� ��	���d+XZ�O!����6�Ԃ:g�6�_P�ߗԆv��6~��Z>�C�KpmO�K�3p��Yj��$�ǯe>�.�
�^��w�r㺹3��[���A��� �Q�DwW�8�j�>+B}�Y���չL��on�c�����!t�1+~�v.W�=]��`�]�	.��vl���X�+*��̧�Vb��̆f/7����hSY�u2��{�����5�j����Yo�ќ�Y3��4D���/��Ѽȫ]��mr�,P���^�r^y����þJ8�����x6�E�F���E\�n�su�����.a�pRq*�Xif*mG�@���<��U�T>�J� ؉�G��|�������Q��\?�7�U�O���I�ID�1�nܨ��.[��b$A�eJ�v��@^�!����z��F����P�ʹ�hg)��l�j��`��F�0?H,l�xu}�e�a��1d�~%6C�=���}��0�W�FL�~��}������h��aݪO�09 Cea���7;�γ7��3�𬠄��^�]{a߮�q/Z��/��@����p7Ò����
i \Vo�����7�L1\��Z�;���i�h G ���iB����a��!���i�ͻ|/�	�+#>�ܡ������PIף��Z�J�d� �4>6m�g��34 Fժ���q>��8�T�.���0~���~��&T�7����Y~!�/kx�ú{|~��F��YI��%\{i=�[oa�.�wY���P����O�kڋ|]��l�N����A7�=�=�h��2�%���2�<WR�k��$U��� ;���e����<���pP>��8M�J�SR>��8ti�z(GOw�W|���Gv-@��R�퀻�&RO����ߑ��)i��*�V/9Y�d�.o_�SD�)��ID��U�s-��*���0�(�+��\Jݥ�\�Ĭ���$�d�V=I��2���╀<�9����-�M��I������M�wR��')V"��wW��p")����q�C�v�?���Y'U�s��l[�@jއI1@�ĭ�,+����ⷦ�9�ްUd�e�x�@k���.����~�����>��!�7��˖�Ǜ������s�]0��	A<�M��&F)2��A�r>O���`�G�=����Oa�_��'Ӏ��J}/�5bQA���M�|���v��$Z`�����+q��f���L�3)I�x�f�Lݴ3��f���'��H�,0;���{@_.���Z�R�þ	���Ph�^2�:�6���'��U���x���th�	z(��Ɠ��M��ػ��,�i7Oj-��oB���+�Q��~=K�Q�LG�Ls���<~�;���"�R
 V�O�*� w�e���[�s�ׯ.�:LQ�Z��!7��a:� m�&}��6��;�M���u�T��I�G�TS��cG=��0O�m.f�Y�r�.=�=�����m���T�����mj����\3�"�1�ɦ[�`&���˩�Yc��i]9p�!��~�m���E������0�L��(�H���U�U�}�3����O�����2�N7 󪋴�������S���Ѓ�6Q���B���[+���m�������ߋQ�'�֯ᵸ��XG�R>���/rEƬ2�Ia����b�����s�͝���mD���N�O�w�R43��9K-D��g�A�#�B3f<r������S�K�b�`;�о�X��r�����x(j�#��)b����ɹ��Ŧ�S��:4�?D��T���H�Y��X���]��h}�~(W	`<�\�q�'Ot���zy�N��h�PH�qaQJ^�9R�y��� T�}��8�/1R^�*�`i�����W3�)|�Y6�i�Z��V�Tŝq�b����I=�Dk����[>���l�yv@Q�5L~fQ
������}�le*Js��eǥ Y� ()���e���a�	�|/@����B��qp-� �ΣTaw��\ǳ�TM31rCؠH���{~�����.�A�>/�%d���Y=x���I���Y�u���#�'�^L8Qj�ԁ\'3X[����]:3�"�;��
#ݴ�zP�� %�9V�����y]����m֙�]$�('�Qae�r?�!���M���$�!�fn�F�����jn�r�w}i�?�uA��߭x����y7E�Q �M�C�O��V؟ơ��1���[�|��|Q���H$�~i�5!������Q%Ba�_�.ێ�tDпFʤ̽$�D-L�꣬�@�S�Z Ә�$1א�UG�S�a�s�ࢪ�%�����pS��^�bt��ݞ�
�F���4A�g�y�_����#?�z��^�T����nª��X%��荗iπTS�׆&1�N٢��J�&�0��1}o�ַ����+�$���y��D����y��xg�$À[����)QX��L�t����B!�N�z`�\9�uN�?W�"J�VnE]������s�d߲�׳0
�Ar�*��{/��͒"̰����v�B�_�q�)(o7c\9�i|u���
����U���#���'EK>�ZNS�"Z`A�
��'��b�I_^E�m�����]>��o����Y�$%��'oF��Ξ<�����f�b>�^#��,
����Q1�<�^K�5�E��s/��}>���^դ;u�Ȯ���Z�C2T��l"R^��t6�?5{C�C�Zt�h(c��m$*�FP�]�a0��I��A	��+w{0 �y��M�a����ie�<��p5�e��(�/�ة��HW���F�F��U;<��Vdr��dɪY�T�k�������&�)n5F����?�(�>�X�c��u�r^�X�o)���*���9���}�K)K@��dLN0%]XH������ds���^���\g�:��!Z�m�g����l��{C�	���6���|~-y��A!�=�uV�W�f�O-Y�;F� �)����R@��_~=�(ԌT��L��g�	��AX}�r��#:�h�I���.!�tn��d���=YJV9�Na�B B	,a拓��b�+��r���l�R�6��{��5g��G(���hx�,A=E�nP��&�i���5J��ަ��9�j���䬊�a�Fc1��4�!���V��"&�,X�[���N}����'�FyY?�{BO��ݛ(՗�&�za
8}���~0�fت��������8�f��5�6�e��i�?1�mK,����]1��jy����ncV.�S��t�٨j��㚥��SDZa{�魵*n�Y_;�ew@��jsG�.�T#�s�t�\/�,�^���OZ �D�P�Y���y�E_&�}\�*�-o�(.)��X���Ll�^RH����:A9��RY�$Jk�.|�s��r�w��՚��}�:��<��ݨ�I���Xy킘w�����|O��n�ۅ��\�%{cn�?q�bx��������}K}ۀ@� �����A�mCi[�����A%�``���kS������!���B��VH)�_�0R�=Qo��*���ۋC`'��I��W�V�����9���E�#�=�
�-�n��쏏�MC�(l����_�ހ���kZ�(�&MLWT�]қ�X}��<��E��t���=1�&Qf� ��eX����SޱX
�<-/�m/�3IWd�b�Sܢ����<��y��w����ʫ2f����]df���� 5bg�L,~��'iEY�a�͝�U:�'�d����5�i�H�@���W�7�"�v4Ѓ��q�'��1��/
��+�4�~`����_��o���Z�Yq��2�b�����" �����S�ƹ�9��R���۩��Rg皿\�/�!��Y�m+~�g����롘+�
�/iS�+*'<��QI)>���&�Bo�"�'1L�^�{{�3J�!"�j�`�N��08.|��ʭ*V؇x����h�Ȱ��{/bv;߽M�o68��~�z1�����-�F�*K!p|	xK�7]���aZ+��U��s��Q�E&]7W���[�2�@ä���텛"���}��V�9���ox�����d��'By(^ƫ�"t�muE7ǃ���ɸ��q��'�LT7���l�6ށ(�G�X�W�}����l޼�7Ԣ�H=nUr|�Z����X��o�8���@s�Z�;����J5��~�;��s���a��<�m\r�`-4�ߙ`���B�:iC�\U�v�J���Xc��T��Y���#����y�4NS@��`��t�����'��E򎱸�P����p��B�Ƿ׀gE�8a��1o�V�<h�Jַ�P���-xސ�L	�f\����iQ�|$kBo8�L�f@��3�<��
'�:d:��)���ϲ�^bJL��.Ս���:�Lˠ\&��p'����@/��:6��}��C�r�ln(�����������,�b����Mg�������@�vw��\��b��2ws�Y$�7���j�oWK�U^H�e�����|T!��3�pm�$�Z�'�W����� ߩ�J��^��{����`���1]URuk.��q V~�Z,�VH�y�P�_�4�NhK-g�+2���$[n[����x�������}���3>OvW�g��L*