var NAVTREE =
[
  [ "AMORE++", "index.html", [
    [ "The AMORE++ package", "index.html", null ],
    [ "Class List", "annotated.html", [
      [ "CompareId", "struct_compare_id.html", null ],
      [ "Con", "class_con.html", null ],
      [ "ConContainer", "class_con_container.html", null ],
      [ "Container< T >", "class_container.html", null ],
      [ "MLPlayer", "class_m_l_player.html", null ],
      [ "MLPlayerContainer", "class_m_l_player_container.html", null ],
      [ "MLPneuralNet", "class_m_l_pneural_net.html", null ],
      [ "MLPneuron", "class_m_l_pneuron.html", null ],
      [ "MLPneuronContainer", "class_m_l_pneuron_container.html", null ],
      [ "NeuralNet", "class_neural_net.html", null ],
      [ "Neuron", "class_neuron.html", null ],
      [ "NeuronContainer", "class_neuron_container.html", null ],
      [ "RBFneuralNet", "class_r_b_fneural_net.html", null ]
    ] ],
    [ "Class Index", "classes.html", null ],
    [ "Class Hierarchy", "hierarchy.html", [
      [ "CompareId", "struct_compare_id.html", null ],
      [ "Con", "class_con.html", null ],
      [ "Container< T >", "class_container.html", null ],
      [ "Container< Con >", "class_container.html", [
        [ "ConContainer", "class_con_container.html", null ]
      ] ],
      [ "Container< MLPlayer >", "class_container.html", [
        [ "MLPlayerContainer", "class_m_l_player_container.html", null ]
      ] ],
      [ "Container< Neuron >", "class_container.html", [
        [ "NeuronContainer", "class_neuron_container.html", null ]
      ] ],
      [ "NeuralNet", "class_neural_net.html", [
        [ "MLPneuralNet", "class_m_l_pneural_net.html", null ],
        [ "RBFneuralNet", "class_r_b_fneural_net.html", null ]
      ] ],
      [ "Neuron", "class_neuron.html", [
        [ "MLPneuron", "class_m_l_pneuron.html", null ]
      ] ],
      [ "NeuronContainer< MLP >", "class_neuron_container.html", [
        [ "MLPneuronContainer", "class_m_l_pneuron_container.html", [
          [ "MLPlayer", "class_m_l_player.html", null ]
        ] ]
      ] ]
    ] ],
    [ "Class Members", "functions.html", null ],
    [ "File List", "files.html", [
      [ "pkg/AMORE/src/AMORE.h", "_a_m_o_r_e_8h.html", null ],
      [ "pkg/AMORE/src/Con.cpp", "_con_8cpp.html", null ],
      [ "pkg/AMORE/src/Con.h", "_con_8h.html", null ],
      [ "pkg/AMORE/src/Container.cpp", "_container_8cpp.html", null ],
      [ "pkg/AMORE/src/Container.h", "_container_8h.html", null ],
      [ "pkg/AMORE/src/Neuron.cpp", "_neuron_8cpp.html", null ],
      [ "pkg/AMORE/src/Neuron.h", "_neuron_8h.html", null ],
      [ "pkg/AMORE/src/old/Con.cpp", "old_2_con_8cpp.html", null ],
      [ "pkg/AMORE/src/old/Con.h", "old_2_con_8h.html", null ],
      [ "pkg/AMORE/src/old/ConContainer.cpp", "_con_container_8cpp.html", null ],
      [ "pkg/AMORE/src/old/ConContainer.h", "_con_container_8h.html", null ],
      [ "pkg/AMORE/src/old/Container.cpp", "old_2_container_8cpp.html", null ],
      [ "pkg/AMORE/src/old/Container.h", "old_2_container_8h.html", null ],
      [ "pkg/AMORE/src/old/MLPlayer.h", "_m_l_player_8h.html", null ],
      [ "pkg/AMORE/src/old/MLPlayerContainer.h", "_m_l_player_container_8h.html", null ],
      [ "pkg/AMORE/src/old/MLPneuralNet.h", "_m_l_pneural_net_8h.html", null ],
      [ "pkg/AMORE/src/old/MLPneuralNetFactory.cpp", "_m_l_pneural_net_factory_8cpp.html", null ],
      [ "pkg/AMORE/src/old/MLPneuron.h", "_m_l_pneuron_8h.html", null ],
      [ "pkg/AMORE/src/old/MLPneuronContainer.h", "_m_l_pneuron_container_8h.html", null ],
      [ "pkg/AMORE/src/old/NeuralNet.h", "_neural_net_8h.html", null ],
      [ "pkg/AMORE/src/old/Neuron.cpp", "old_2_neuron_8cpp.html", null ],
      [ "pkg/AMORE/src/old/Neuron.h", "old_2_neuron_8h.html", null ],
      [ "pkg/AMORE/src/old/NeuronContainer.cpp", "_neuron_container_8cpp.html", null ],
      [ "pkg/AMORE/src/old/NeuronContainer.h", "_neuron_container_8h.html", null ],
      [ "pkg/AMORE/src/old/RBFneuralNet.h", "_r_b_fneural_net_8h.html", null ]
    ] ],
    [ "File Members", "globals.html", null ]
  ] ]
];

function createIndent(o,domNode,node,level)
{
  if (node.parentNode && node.parentNode.parentNode)
  {
    createIndent(o,domNode,node.parentNode,level+1);
  }
  var imgNode = document.createElement("img");
  if (level==0 && node.childrenData)
  {
    node.plus_img = imgNode;
    node.expandToggle = document.createElement("a");
    node.expandToggle.href = "javascript:void(0)";
    node.expandToggle.onclick = function() 
    {
      if (node.expanded) 
      {
        $(node.getChildrenUL()).slideUp("fast");
        if (node.isLast)
        {
          node.plus_img.src = node.relpath+"ftv2plastnode.png";
        }
        else
        {
          node.plus_img.src = node.relpath+"ftv2pnode.png";
        }
        node.expanded = false;
      } 
      else 
      {
        expandNode(o, node, false);
      }
    }
    node.expandToggle.appendChild(imgNode);
    domNode.appendChild(node.expandToggle);
  }
  else
  {
    domNode.appendChild(imgNode);
  }
  if (level==0)
  {
    if (node.isLast)
    {
      if (node.childrenData)
      {
        imgNode.src = node.relpath+"ftv2plastnode.png";
      }
      else
      {
        imgNode.src = node.relpath+"ftv2lastnode.png";
        domNode.appendChild(imgNode);
      }
    }
    else
    {
      if (node.childrenData)
      {
        imgNode.src = node.relpath+"ftv2pnode.png";
      }
      else
      {
        imgNode.src = node.relpath+"ftv2node.png";
        domNode.appendChild(imgNode);
      }
    }
  }
  else
  {
    if (node.isLast)
    {
      imgNode.src = node.relpath+"ftv2blank.png";
    }
    else
    {
      imgNode.src = node.relpath+"ftv2vertline.png";
    }
  }
  imgNode.border = "0";
}

function newNode(o, po, text, link, childrenData, lastNode)
{
  var node = new Object();
  node.children = Array();
  node.childrenData = childrenData;
  node.depth = po.depth + 1;
  node.relpath = po.relpath;
  node.isLast = lastNode;

  node.li = document.createElement("li");
  po.getChildrenUL().appendChild(node.li);
  node.parentNode = po;

  node.itemDiv = document.createElement("div");
  node.itemDiv.className = "item";

  node.labelSpan = document.createElement("span");
  node.labelSpan.className = "label";

  createIndent(o,node.itemDiv,node,0);
  node.itemDiv.appendChild(node.labelSpan);
  node.li.appendChild(node.itemDiv);

  var a = document.createElement("a");
  node.labelSpan.appendChild(a);
  node.label = document.createTextNode(text);
  a.appendChild(node.label);
  if (link) 
  {
    a.href = node.relpath+link;
  } 
  else 
  {
    if (childrenData != null) 
    {
      a.className = "nolink";
      a.href = "javascript:void(0)";
      a.onclick = node.expandToggle.onclick;
      node.expanded = false;
    }
  }

  node.childrenUL = null;
  node.getChildrenUL = function() 
  {
    if (!node.childrenUL) 
    {
      node.childrenUL = document.createElement("ul");
      node.childrenUL.className = "children_ul";
      node.childrenUL.style.display = "none";
      node.li.appendChild(node.childrenUL);
    }
    return node.childrenUL;
  };

  return node;
}

function showRoot()
{
  var headerHeight = $("#top").height();
  var footerHeight = $("#nav-path").height();
  var windowHeight = $(window).height() - headerHeight - footerHeight;
  navtree.scrollTo('#selected',0,{offset:-windowHeight/2});
}

function expandNode(o, node, imm)
{
  if (node.childrenData && !node.expanded) 
  {
    if (!node.childrenVisited) 
    {
      getNode(o, node);
    }
    if (imm)
    {
      $(node.getChildrenUL()).show();
    } 
    else 
    {
      $(node.getChildrenUL()).slideDown("fast",showRoot);
    }
    if (node.isLast)
    {
      node.plus_img.src = node.relpath+"ftv2mlastnode.png";
    }
    else
    {
      node.plus_img.src = node.relpath+"ftv2mnode.png";
    }
    node.expanded = true;
  }
}

function getNode(o, po)
{
  po.childrenVisited = true;
  var l = po.childrenData.length-1;
  for (var i in po.childrenData) 
  {
    var nodeData = po.childrenData[i];
    po.children[i] = newNode(o, po, nodeData[0], nodeData[1], nodeData[2],
        i==l);
  }
}

function findNavTreePage(url, data)
{
  var nodes = data;
  var result = null;
  for (var i in nodes) 
  {
    var d = nodes[i];
    if (d[1] == url) 
    {
      return new Array(i);
    }
    else if (d[2] != null) // array of children
    {
      result = findNavTreePage(url, d[2]);
      if (result != null) 
      {
        return (new Array(i).concat(result));
      }
    }
  }
  return null;
}

function initNavTree(toroot,relpath)
{
  var o = new Object();
  o.toroot = toroot;
  o.node = new Object();
  o.node.li = document.getElementById("nav-tree-contents");
  o.node.childrenData = NAVTREE;
  o.node.children = new Array();
  o.node.childrenUL = document.createElement("ul");
  o.node.getChildrenUL = function() { return o.node.childrenUL; };
  o.node.li.appendChild(o.node.childrenUL);
  o.node.depth = 0;
  o.node.relpath = relpath;

  getNode(o, o.node);

  o.breadcrumbs = findNavTreePage(toroot, NAVTREE);
  if (o.breadcrumbs == null)
  {
    o.breadcrumbs = findNavTreePage("index.html",NAVTREE);
  }
  if (o.breadcrumbs != null && o.breadcrumbs.length>0)
  {
    var p = o.node;
    for (var i in o.breadcrumbs) 
    {
      var j = o.breadcrumbs[i];
      p = p.children[j];
      expandNode(o,p,true);
    }
    p.itemDiv.className = p.itemDiv.className + " selected";
    p.itemDiv.id = "selected";
    $(window).load(showRoot);
  }
}

